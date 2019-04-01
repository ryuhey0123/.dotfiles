#!/bin/sh

# PDFの結合

pdf_concat() {

    OUT_VALUE="output.pdf"
    INP_VALUE=""
    FLG_O="FALSE"

    while getopts o: OPT

    do
        case $OPT in
            o ) FLG_O="TRUE" ; OUT_VALUE="$OPTARG" ;;
        esac
    done

    if [ $FLG_O = "TRUE" ]; then
        INP_VALUE=${@:3}
    else
        INP_VALUE=${@:1}
    fi

    gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$OUT_VALUE $INP_VALUE
}

