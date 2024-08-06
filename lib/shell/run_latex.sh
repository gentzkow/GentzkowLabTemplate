#!/bin/bash

unset run_latex
run_latex() {

    # Get arguments
    programname=$(basename "$1" .tex)
    logfile="$2"

    echo "Executing: latexmk ${programname}.tex -pdf -bibtex"
    (latexmk "${programname}.tex" -pdf -bibtex >> "${logfile}" 2>&1)

    # Clean up
    mv "${programname}.pdf" ../output
    rm -f "${programname}.aux"
    rm -f "${programname}.bbl"
    rm -f "${programname}.blg"
    rm -f "${programname}.log" 
    rm -f "${programname}.out"
    rm -f "${programname}.fdb_latexmk" 
    rm -f "${programname}.fls" 
    rm -f "${programname}.synctex.gz"
    rm -f "${programname}.nav" 
    rm -f "${programname}.snm" 
    rm -f "${programname}.toc" 
}

