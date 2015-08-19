(TeX-add-style-hook
 "Chapter6"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (LaTeX-add-labels
    "chap6"
    "C6-sec:introduction"
    "C6-sec:theor-cons"
    "C6-sec:const-equat-1"
    "C6-Figure2-1"
    "C6-topo"
    "C6-eq16"
    "C6-eq12"
    "C6-eq18"
    "C6-eq19"
    "C6-eq11"
    "C6-eq21"
    "C6-eqqqq"
    "C6-Dimensionless1"
    "C6-n1"
    "C6-n2"
    "C6-n3"
    "C6-n4"
    "C6-n5"
    "C6-sec:end-member-modes-1"
    "C6-Figure2-2"
    "C6-sec:grav-sign-ffcs-1"
    "C6-Figure2-3"
    "C6-sec:grails-gravity-model-1"
    "C6-Figure2-4"
    "C6-Figure2-5"
    "C6-sec:grav-sign-lunar"
    "C6-sec:unmod-floor-fract"
    "C6-Figure3-1"
    "C6-sec:crat-grav-sign"
    "C6-sec:highlands-1"
    "C6-Figure3-2"
    "C6-sec:lunar-maria-spa"
    "C6-Figure3-3"
    "C6-sec:magm-intr-char"
    "C6-sec:intrusion-thickness"
    "C6-Figure4-1"
    "C6-sec:intr-dens-contr"
    "C6-sec:discussion"
    "C6-sec:conclusion")))

