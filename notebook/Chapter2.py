from Plot import *
import matplotlib.colors as mcolors
import Figure_Tool as ft
import matplotlib.pylab as pyl
from operator import and_
from itertools import *
from pylab import cm
import matplotlib as mpl
from math import *
from scipy.odr import *
import itertools
from sympy import *
import matplotlib.gridspec as gridspec
import seaborn as sns

class Figure_chapter_2(Plot):
    
    '''- Class Pour les Figures JFM, on etudie
    le champ de temperature dans l'intrusion
    
    - Class qui permet a partir d'une liste d'objet 
    de type de run de faire des graphs data:
    List correspond a la liste dobjet de type run
    method:
    m_Scal_R : Realise une graph de R enfonction de t'''

    def __init__(self, d_w):
        Plot.__init__(self)
        self.d_w = d_w
        self.xlabel = ''
        self.ylabel = ''
        self.path_save = '/Users/thorey/Documents/These/Manuscript/Figure/Chapter2/'
    
    def _m_label(self,run,var):
        
        dict_label = {'nu': r'$\nu$ = ' + str(float(run.Nsd.nu)),
                      'Pe': r'$Pe$ = ' + str(float(run.Nsd.Pe)),
                      'delta0': r'$\delta_0$ = ' + str(float(run.Nsd.delta0)),
                      'sigma': r'$\sigma$ = ' + str(float(run.Nsd.gam)),
                      'PeN1':r'$(Pe,N_1) = $('+str(float(run.Nsd.Pe))+','+str(float(run.Nsd.N1))+')',
                      'PeNu':r'$(\nu,Pe) = $('+str(float(run.Nsd.nu))+','+str(float(run.Nsd.Pe))+')',
                      'PemNu':r'$(\nu,Pe_m) = $('+str(float(run.Nsd.nu))+','+str(float(run.Nsd.Pe))+')',
                      'PePsi':r'$(Pe,\Psi) = $('+str(float(run.Nsd.Pe))+','+str(float(run.Nsd.Psi))+')',
                      'PsiNu':r'$(\nu,St_m) = $('+str(float(run.Nsd.nu))+','+'{:1.2f}'.format(1./float(1+run.Nsd.Psi))+')',
                      'hfNu':r'$(\nu,h_f) = $('+str(float(run.Nsd.nu))+','+str(float((run.Nsd.delta0)))+')'}
        return dict_label[var]

    def m_initialize_mpl(self):

        mpl.rcdefaults()
        mpl.rcParams['axes.labelsize']=self.font
        mpl.rcParams['figure.facecolor']='None'
        mpl.rcParams['lines.linewidth'] =1.5
        
    def C2_ELAS_GRAV_Sigma(self):

        fig,ax = self.m_sub_figure(1,2)
        ax_left = ax[0][0]
        ax_right  = ax[1][0]

        for key,run in self.d_w.iteritems():
            ind =self.Indice_time(run,[1e-4])[0]
            ind2 =self.Indice_time(run,[6e2])[0]
            tm = run.tm[ind:ind2]
            R = run.R[ind:ind2]
            H = run.H[ind:ind2]
            ax_left.loglog(tm,H,
                           label = self._m_label(run,'sigma'),
                           color = self.m_Kwargs(run.nu,run.gam))
            ax_right.loglog(tm,R,
                            label = self._m_label(run,'sigma'),
                            color = self.m_Kwargs(run.nu,run.gam))

        tm = np.arange(1e-4,1e3)
        ax_left.loglog(tm,1.6*run.nu**(-1./4.)*tm/tm,
                       color = 'k',
                       linestyle = ':')
        ax_right.loglog(tm,1.15*run.nu**(1./8.)*tm**(1./2.),
                        color = 'k',
                        linestyle = ':')
        ax_left.loglog(tm,0.69*run.delta0**(-1./11.)*run.nu**(-2./11.)*tm**(4./11.),
                       color = 'k',
                       linestyle = '--')
        ax_right.loglog(tm,2.22*run.delta0**(1./22.)*run.nu**(1./11.)*tm**(7./22.),
                        color = 'k',
                        linestyle = '--')
        # ax_left.loglog(tm, tm/tm,color = 'k',linestyle = '-.')
        # ax_right.loglog(tm, (tm/(4*np.pi))**(1./4.),color = 'k',
        #                 linestyle = '-.')
        
        self.x_label = r'Dimensionless time $t$' 
        self.y_label = r'Dimensionless thickness $h_0$'
        self.y_lim = 1e-2,10
        self.m_axes_Ss_L(ax_left)
        self.x_label = r'Dimensionless time $t$' 
        self.y_label = r'Dimensionless radius $R$'
        self.y_lim = 1e-2,1e2
        self.m_axes_Ss_L(ax_right) 
        self.m_save_fig(fig)
        
    def C2_ELAS_GRAV_Profil(self):
        
        fig , ax = self.m_figure()
        color = sns.color_palette('Blues_r')
        k = 0
        for key, run in self.Dict_w.iteritems():
            for i,dat in enumerate(run.data):
                if i in [50,60,70,75,82]:
                    ax.plot(list(-dat.dist[::-1])+list(dat.dist) ,list(dat.H[::-1])+list(dat.H),
                            color = color[k],
                            label = 't=%2.1f'%(dat.tm[0]))
                    k+=1

        self.x_label = r'Dimensionless axis $r$' 
        self.y_label = r'Dimensionless thickness $h(r,t)$'
        self.x_lim = -10,10
        self.y_lim = 0,2.5
        self.m_axes(ax)
        self.m_save_fig(fig)
        
        ############
        #TOOLS
        
    def m_Kwargs(self,nu,gam):
        ''' Retourn un dict d'argument {'color': ---,'linestyle'='---'}
        pour un plot. '''''
        
        knu = 'nu'+str(nu)
        kgam = 'ga'+str(gam)
        
        Nul =  ['nu1.0','nu0.1','nu0.01','nu0.001','nu0.0001','nu1e-05']
        gam = ['ga0.0','ga0.5','ga1.0','ga2.0']
        color = [sns.color_palette(f+'_r') for f in ['Blues','Purples','Greens','Reds','Greys','Blues']]
        zip_color = dict(zip(Nul,color))

        return zip_color[knu][gam.index(kgam)]
        
    def Indice_time(self,run,tmps):

        ''' Retrouve l'indice lier au temps donnee
        tmps est une liste'''''
        indice = []
        tmps = np.array(tmps)
        if type(tmps) != np.ndarray:
            print 'Attention: Need a list as input', type(tmps)
            sys.exit()
        for elt in tmps:
            if elt > run.tm.max():
                print 'temps trop grand !!'
                sys.exit()
            for i,t in enumerate(run.tm):
                if run.tm[i]< elt:
                    continue
                else:
                    indice.append(i-1)
                    break

        return indice
