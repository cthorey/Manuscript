(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ThesisStyle" "a4paper" "12pt" "twoside")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (TeX-run-style-hooks
    "latex2e"
    "formatAndDefs"
    "TitlePage_Final"
    "Remerciement"
    "abstract_en"
    "abstract_fr"
    "Chapter/Chapter7"
    "Notations"
    "ThesisStyle"
    "ThesisStyle12"
    "graphicx"
    "array"
    "amsmath"
    "pdfpages"
    "natbib"
    "inputenc"
    "fontenc"
    ""
    "textcomp"
    "amssymb"
    "lscape"
    "gensymb"
    "makeidx")
   (LaTeX-add-bibliographies
    "/Users/thorey/Dropbox/Library")))

