(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ThesisStyle" "a4paper" "12pt" "twoside")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("chapterbib" "sectionbib") ("inputenc" "utf8") ("fontenc" "T1")))
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
    "ThesisStyle"
    "ThesisStyle12"
    "graphicx"
    "array"
    "amsmath"
    "pdfpages"
    "natbib"
    "chapterbib"
    "inputenc"
    "fontenc"
    "appendix"
    "chngcntr"
    "etoolbox"
    "makeidx")))

