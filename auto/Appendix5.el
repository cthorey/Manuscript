(TeX-add-style-hook
 "Appendix5"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (LaTeX-add-labels
    "C6-chap:A5"
    "sec:synth-grav-anom-1"
    "sec:effect-downw-cont"
    "Figure_Supp_1"
    "Figure_Supp_2"
    "Table3-1"
    "sec:crater-depth"
    "Table4-1"
    "Table4-2"
    "Table4-3")))

