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
    "TitlePage"
    "Remerciement"
    "abstract_en"
    "abstract_fr"
    "Chapter/Chapter1"
    "Chapter/Chapter2"
    "Part2_Intro"
    "Chapter/Chapter3"
    "Chapter/Chapter4"
    "Part3_Intro"
    "Chapter/Chapter5"
    "Chapter/Chapter6"
    "Chapter/Chapter7"
    "Appendix/Appendix1"
    "Appendix/Appendix2"
    "Appendix/Appendix3"
    "Appendix/Appendix4"
    "Appendix/Appendix5"
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

