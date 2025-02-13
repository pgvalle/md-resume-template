#!/bin/sh

command_exists() {
    if ! command -v $1 > /dev/null 2>&1; then
        echo "$1 is not installed. Please install it and try again."
        exit 1
    fi
}

command_exists md2pdf
command_exists weasyprint

OUTPUT_DIR=out
DATETIME=`date +%d.%m.%Y-%Hh%Mm`

mkdir -p $OUTPUT_DIR

md2pdf resume.md $OUTPUT_DIR/resume-$DATETIME.pdf --css style.css
