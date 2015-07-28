(TeX-add-style-hook
 "formatAndDefs"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "latin1") ("fontenc" "T1") ("geometry" "left=1.5in" "right=1.3in" "top=1.1in" "bottom=1.1in" "includefoot" "includehead" "headheight=13.6pt") ("tocbibind" "nottoc" "notlof" "notlot") ("nomencl" "intoc") ("graphicx" "pdftex") ("hyperref" "a4paper" "pagebackref" "hyperindex=true" "dvipdfm") ("algorithmic" "noend")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (TeX-run-style-hooks
    "amsmath"
    "amssymb"
    "inputenc"
    "fontenc"
    "geometry"
    "tocbibind"
    "minitoc"
    "aecompl"
    "nomencl"
    "ifpdf"
    "graphicx"
    "hyperref"
    "color"
    "rotating"
    "fancyhdr"
    "colortbl"
    "algorithm"
    "algorithmic"
    "multirow")
   (TeX-add-symbols
    '("reviewtimetoday" 2)
    '("eqRef" 1)
    '("pd" 2)
    '("nomunit" 1)
    "abs"
    "argmax"
    "argmin"
    "diag"
    "headruleORIG"
    "cleardoublepage"
    "minitocORIG")
   (LaTeX-add-environments
    '("maxime" 1)
    "bulletList"
    "definition"
    "vcenterpage")
   (LaTeX-add-color-definecolors
    "linkcol"
    "citecol")))

