#!/bin/bash

declare -i count
# skip the first two lines (empty line and another header line)

# count the number of lines in file
count=$(wc br3pin.crs | tr -s " " |  cut -d' ' -f2)
# subtract the header lines
let count=count-3

paste <(seq 0 $count) <(tail -n+3 br3pin.crs | tr -s " " | cut -d' ' -f7) > br3pin.enorm

gnuplot << INPUT
set term png 
set output "enorm.png"
plot "br3pin.enorm" using 1:2 with points
INPUT
