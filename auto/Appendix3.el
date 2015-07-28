(TeX-add-style-hook
 "Appendix3"
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
    "chap:A3"
    "Scaling_HR_ELAS_APPENDIX"
    "R_Rc_ELAS_APPENDIX"
    "C3-PhaseDiagramJFM_Appendix"
    "C4-Heat:AppendixC"
    "C4-Appendix_Phase2_N11_0_Pe100_0_nu0_001")))

