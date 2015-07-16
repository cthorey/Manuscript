(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ThesisStyle" "a4paper" "12pt" "twoside")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1")))
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
    "Appendix/Appendix1"
    "Appendix/Appendix2"
    "Appendix/Appendix3"
    "Appendix/Appendix4"
    "Appendix/Appendix5"
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
    "makeidx")
   (LaTeX-add-bibliographies
    "/Users/thorey/Dropbox/Library")))

