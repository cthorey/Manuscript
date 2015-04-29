(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ThesisStyle" "a4paper" "12pt" "twoside")))
   (TeX-run-style-hooks
    "latex2e"
    "formatAndDefs"
    "TitlePage"
    "Remerciement"
    "traduction"
    "Chapter/Chapter1"
    "Chapter/Chapter2"
    "Chapter/Chapter3"
    "Chapter/Chapter4"
    "Chapter/Chapter5"
    "Chapter/Chapter6"
    "Chapter/Chapter7"
    "ThesisStyle"
    "ThesisStyle12"
    "graphicx"
    "array"
    "amsmath"
    "natbib"
    "makeidx")
   (LaTeX-add-bibliographies
    "/Users/thorey/Dropbox/Library")))

