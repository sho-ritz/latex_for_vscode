#!/usr/bin/env perl

$out_dir = 'out';
$jobname = 'main_SONOBE_paper2025';

# LaTeX（pLaTeX）- jreport2.clsはJY1エンコーディングを使用するためplatexが必要
$latex = 'platex -synctex=1 -halt-on-error -file-line-error %O %S';
$max_repeat = 15;

# BibTeX（pBibTeX）※ %B を使う
$bibtex = 'pbibtex %O %B';

# biblatex+biber を使うならこちら（使わないなら放置でOK）
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %B';

$makeindex = 'mendex %O -o %D %S';

$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;

$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $dvi_previewer = "open %S";
    $pdf_previewer = "open %S";
} else {
    $dvi_previewer = "start %S";
    $pdf_previewer = "start %S";
}

$clean_full_ext = "synctex.gz";
