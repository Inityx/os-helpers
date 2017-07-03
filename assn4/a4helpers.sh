#!/bin/bash
randport() { echo $((RANDOM % 10000 + 55000)); }
runscript() {
    r1=$(randport)
    r2=$(randport)
    echo "Running script with ports $r1, $r2"
    ../../p4gradingscript "$r1" "$r2" 2>&1
}
go() {
    cp ../../p4plaintexts/* ./
    runscript &>results
    less results
}
