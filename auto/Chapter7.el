(TeX-add-style-hook
 "Chapter7"
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
    "chap9"
    "sec:dynam-shall-magm-1"
    "sec:summary-2"
    "sec:rigor-treatm-front"
    "sec:fracturation"
    "C7-Sketch"
    "sec:generalization-model"
    "subsubsection"
    "C7-Baula"
    "sec:topography-1"
    "sec:terr-intr-magm"
    "sec:summary"
    "sec:crust-magm-intr"
    "sec:thickn-lunar-maria"
    "sec:other-terr-plan"
    "C7-FFCOther")))

