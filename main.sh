#!/bin/sh

grepP() {
    if ! test -f "countries"; then
    curl --silent --output countries https://gist.githubusercontent.com/kalinchernev/486393efcca01623b18d/raw/daa24c9fea66afb7d68f8d69f0c4b8eeb9406e83/countries
    fi

    grepPCountries=$(grep ^P countries)
    echo $grepPCountries | tr a-z A-Z

    if test -f "countries"; then
    echo "Enter country you want to check: "

    read string
    if grep -qFxi "$string" countries;then
    echo "true"
    else
    echo "false"
    fi
    else
    exit 1
    fi
} 2> log.txt
grepP
