# Class that handle the format of the data for the cooling

import sys
import cPickle as pickle
import pandas as pd
import os
import numpy as np
import itertools
from scipy import integrate
import bisect
from math import *

class Load(object):

    def __init__(self,input_file):
        
        self.input_file = input_file

    def _m_unload_pickle(self):

        with open(self.input_file, 'rb') as f:
            try:
                data_pickle = pickle.load(f)
            except:
                data_pickle = pd.read_pickle(self.input_file)

        Max = pd.DataFrame(data_pickle['Max'])
        Nsd = data_pickle['NsD']
        try:
            data = data_pickle['Data']
        except:
            data = 'Pas de data'

        return Max, Nsd, data
        

    def m_load(self):
        return self._m_unload_pickle()
    
    def temp(s):
        if s < float(0.001):
            return np.float(0.001)
        else:
            return s
        
    def m_Rayon(self):
        self.Max, self.Nsd, self.data = self.m_load()

        List_V = [0.01,0.05,0.5,1,0.1,0.008]
        Dict_Ray = {''.join(str(f).split('.')):f for f in List_V}
        d_final = {}
        def Rc(df,value):
            filtre = filter(lambda x:x<value,dat.Te.tolist())
            if len(filtre)==0:
                return dat.R.max()
            else:
                indice = dat.Te.tolist().index(filtre[0])
                if indice == 0:
                    return dat.R.max()
                else:
                    return dat.dist[indice-1]
        for key,value in Dict_Ray.iteritems():
            d_final['Rc_'+key] = [Rc(dat,value)
                                  for i, dat in enumerate(self.data)]
        return pd.DataFrame(d_final)

    def m_Rayon_Average(self):
        self.Max, self.Nsd, self.data = self.m_load()

        List_V = [0.01,0.05,0.5,1,0.1,0.008]
        Dict_Ray = {''.join(str(f).split('.')):f for f in List_V}
        d_final = {}
        def Rc(df,value):
            filtre = filter(lambda x:x<value,dat.Te.tolist())
            if len(filtre)==0:
                return dat.R.max()
            else:
                indice = dat.Te.tolist().index(filter(lambda x:x<value,dat.Te.tolist())[0])
                if indice == 0:
                    return dat.R.max()
                else:
                    return dat.dist[indice-1]
        for key,value in Dict_Ray.iteritems():
            d_final['Rc_'+key] = [Rc(dat,value)
                                  for i, dat in enumerate(self.data)]
        return pd.DataFrame(d_final)
    def m_Max_Final(self):

        a = self.m_Rayon()
        # b = self.m_Effective()
        self.Max = self.Max.join(a)# .join(b)
        return self.Max
        
class Run(Load):
    ''' Definit les objects d'interet pour le code cooling ainsi qu'un ensemble
    de method '''

    def __init__(self,input_racine,name):
        input_file = os.path.join(input_racine,name)
        Load.__init__(self,input_file)
        self.name = name
        self.rheology = input_racine.split('_')[-3].split('/')[0][1:]
        self.eta_r = self.rheol(self.rheology)
        print self.rheology
        self.racine = input_racine
        self.Max, self.Nsd, self.data = self.m_load()
        self.Max = self.m_Max_Final()
        for key,data in self.Max.iteritems():
            setattr(self,key,data)
        Nsd = {col:float(self.Nsd[col]) for col in self.Nsd.columns}
        for key,data in Nsd.iteritems():
            setattr(self,key,data)

    def rheol(self,rheo):
        if rheo == 'Bercovici':
            return '\eta_{1}'
        else:
            return '\eta_2'
            
    def max_time(self):
        return self.tm.max()
        
    def Indice_time(self,tmps):

        ''' Retrouve l'indice lier au temps donnee
        tmps est une liste'''''
        indice = []
        tmps = np.array(tmps)
        if type(tmps) != np.ndarray:
            print 'Attention: Need a list as input', type(tmps)
            sys.exit()
        for elt in tmps:
            if elt > self.tm.max():
                print 'temps trop grand !!'
                sys.exit()
            for i,t in enumerate(self.tm):
                if self.tm[i]< elt:
                    continue
                else:
                    indice.append(i-1)
                    break
        return indice

    def Grid_Value(self,res,Hmax,ind_t):
        '''Calcul la valeur du cjamp correspodnant'''
        
        struct = 'Struct_R'+str(res)+'_H'+str(Hmax)+'_t'+str(ind_t)
        name_struct = os.path.join(self.racine,'TStructure/',self.name,struct)
        if os.path.isfile(name_struct):
            print 'la structure exsite deja'
            with open(name_struct, 'rb') as f:
                df = pickle.load(f)
            return df['z'],df['theta']
        else:
            print 'La structure n existe pas encore'
            df = self.data[ind_t]
            Size = len(df.dist)
            z = np.arange(0,Hmax,res)
            print 'La resoltuion est de %f et donc le vecteur de taill %d'%(res,len(z))
            theta=np.zeros((len(z),Size))
            for i,elt_i in enumerate(df.Te):
                for j,elt_j in enumerate(z) :                        
                    if z[j]<df.BL[i] :
                        theta[j,i] = df.Te[i]-(df.Te[i]-df.Ts[i])*(1.0-z[j]/df.BL[i])**2
                    elif df.BL[i]<z[j] and z[j]<(df.H[i]-df.BL[i]) :
                        theta[j,i]=df.Te[i]
                    elif (df.H[i]-df.BL[i])<z[j] and z[j]<df.H[i] :
                        theta[j,i] = df.Te[i]-(df.Te[i]-df.Ts[i])*(1.0-(df.H[i]-z[j])/df.BL[i])**2
                    elif z[j]>df.H[i] :
                        theta[j,i] = df.Ts[i]*erfc(np.sqrt(self.Pe)*(z[j]-df.H[i])/(2*np.sqrt(df.tm[i])))
            if not os.path.isdir(os.path.join(self.racine,'TStructure')):
                os.mkdir(os.path.join(self.racine,'TStructure'))
            path_struct = os.path.join(self.racine,'TStructure',self.name)
            if not os.path.isdir(path_struct):
                os.mkdir(path_struct)
            df = {'z':z,'theta':theta}
            with open(name_struct, 'wb') as f:
                pickle.dump(df, f, pickle.HIGHEST_PROTOCOL)
            
            return z,theta
def to_s(s):
    s= str(s).replace('D','E')
    try:
        s1 = np.float(s)
        return str(s1)
    except ValueError:
        return str(np.float(0))

def Name_workspace(Version,run):
    if Version == 1.0 :
        name = str('E' + to_s(run['El'])
                   + '_G' + to_s(run['Grav'])
                   + '_N' + to_s(run['Nu'])
                   + '_P' + to_s(run['Pe'])
                   + '_D' + to_s(run['Delta0'])
                   + '_C' + to_s(run['Psi'])
                   + '_R' + to_s(run['N1'])
                   + '_S' + to_s(run['Sigma'])
                   + '_Dr' + to_s(run['Dr'])
                   + '_Ep' + to_s(run['Eps']))
    elif Version == 1.1:
        name = str('el' + to_s(run['El'])
                   + '_gr' + to_s(run['Grav'])
                   + '_de' + to_s(run['Delta0'])
                   + '_si' + to_s(run['Sigma'])
                   + '_nu' + to_s(run['Nu'])
                   + '_Pe' + to_s(run['Pe'])
                   + '_Ps' + to_s(run['Psi'])
                   + '_N1' + to_s(run['N1'])
                   + '_M' + to_s(run['M'])
                   + '_Dt' + to_s(run['Dt'])
                   + '_Dr' + to_s(run['Dr'])
                   + '_ep' + to_s(run['Eps']))
    elif Version == 1.2:
        name = str('el' + to_s(run['El'])
                   + '_gr' + to_s(run['Grav'])
                   + '_de' + to_s(run['Delta0'])
                   + '_si' + to_s(run['Sigma'])
                   + '_nu' + to_s(run['Nu'])
                   + '_Pe' + to_s(run['Pe'])
                   + '_Ps' + to_s(run['Psi'])
                   + '_N1' + to_s(run['N1'])
                   + '_ga' + to_s(run['Gamma'])
                   + '_In' + to_s(run['Interval_Tmps'])
                   + '_M' + to_s(run['M'])
                   + '_Dt' + to_s(run['Dt'])
                   + '_Dr' + to_s(run['Dr'])
                   + '_ep' + to_s(run['Eps']))
    return name
        
def load_run(dict_p,dir_w,version):
    ''' Fonction qui renvoie une liste d'objet Run
    correspondant au combinaison possible des
    parametre du dictionnaire d'entre '''

    product = [x for x in apply(itertools.product, dict_p.values())]
    Dict_Run = [dict(zip(dict_p.keys(), p)) for p in product]
    # print Dict_Run
    dict_obj = {}
    for run in Dict_Run:
        name = Name_workspace(version,run)
        test = os.path.isfile(os.path.join(dir_w,name))
        if test:
            dict_obj[name]=Run(dir_w,name)
            print '%s Succesfully load'%(name)
        else :
            print 'Load Failed'
            print 'Name: %s'%(name)
            print 'Dir: %s'%(dir_w)
    return dict_obj



    
