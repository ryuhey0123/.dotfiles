tex               = 'platex -synctex=1';
$latex_silent     = 'platex -synctex=1 -interaction=batchmode';
$pdflatex         = 'pdflatex -synctex=1 %O %S';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3; # generates pdf via dvipdfmx

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
$pdf_previewer    = "open -a /Applications/Skim.app";

