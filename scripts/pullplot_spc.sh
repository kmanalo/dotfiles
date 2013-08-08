#!/bin/bash

declare -i count
# skip the first two lines (empty line and another header line)

# count the number of lines in file
count=$(wc br3pin.spc | tr -s " " |  cut -d' ' -f2)

paste <(seq 0 $count) <(tail -n+3 br3pin.spc | tr -s " " | cut -d' ' -f7) > br3pin2col.spc

gnuplot << INPUT
set term png 
set output "spc.png"
plot "br3pin2col.spc" using 1:2 with points
INPUT
