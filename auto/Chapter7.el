(TeX-add-style-hook
 "Chapter7"
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
    "chap7"
    "C7-sec:summary-2"
    "C7-sec:what-limits-extent"
    "sec:rigor-treatm-front"
    "sec:fracturation"
    "sec:fluid-gap"
    "C7-Sketch"
    "sec:generalization-model"
    "C7-Heat_Budget"
    "Stretchingoftheupper_layer"
    "C7-Baula"
    "sec:topography-1"
    "C7-Volcano")))

