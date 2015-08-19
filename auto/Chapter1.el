(TeX-add-style-hook
 "Chapter1"
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
    "chap1"
    "C1-sec:magm-intr-un"
    "C1-sec:formation-1"
    "C1-Geoterme"
    "C1-sec:transport"
    "C1-sec:stockage"
    "C1-Neutral_Zone"
    "C1-sec:zool-des-intr"
    "C1-sec:definition"
    "C1-Dimension"
    "C1-picture"
    "C1-Horsmann"
    "C1-sec:moon"
    "C1-MO"
    "C1-LunarCrust"
    "Maria"
    "C1-Moon-magma"
    "C1-sec:orign-theor-fram"
    "C1-sec:model-statique-de"
    "C1-sec:empl-dynam-des"
    "C1-Model"
    "C1-sec:conclusion")))

