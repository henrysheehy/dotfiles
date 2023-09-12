$pdf_mode = 1;
$pdflatex = 'lualatex';

# $pdflatex = "lualatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1";

# $latexmk = "latexmk -lualatex -file-line-error -interaction=nonstopmode -halt-on-error -synctex=1";

# PythonTeX
# add_cus_dep('pytxcode', 'tex', 0, 'pythontex');
# sub pythontex { return system("pythontex \"$_[0]\""); }
# $clean_ext = "pytxcode";
