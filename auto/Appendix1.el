(TeX-add-style-hook
 "Appendix1"
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
    "chap:A1"
    "A1-sec:-cool-elast-plat"
    "C3-sec:general-procedure"
    "C4-Num-1"
    "C4-Fn1"
    "C4-Num-3"
    "C4-Num-4"
    "C4-C2-eq12"
    "C4-Num-5"
    "sec:integral-expressions"
    "A1-sec:numer-scheme-crat"
    "C5-eq27"
    "C5-Fourth"
    "C5-num1"
    "C5-num2"
    "C5-num3"
    "C5-num6"
    "C5-num4"
    "C5-num5"
    "C5-eqd3")))

