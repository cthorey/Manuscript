(TeX-add-style-hook
 "Plan"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "amsmath"
    "graphicx"
    "fullpage"
    "hyperref"
    "natbib"
    "inputenc"
    "fontenc"
    "color")
   (LaTeX-add-labels
    "sec:orig-transp-et")))

