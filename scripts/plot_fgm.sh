#!/bin/bash

gnuplot << INPUT
set term png 
set output "fgm.png"
set xlabel "Forward Groups"
set ylabel "Scalar Flux"
set title "Scalar Flux vs. Forward Group for each Material"
plot "graph.fgm" using 1:2 title "Fuel" with points, \
     "graph.fgm" using 1:4 title "Clad" with points, \
     "graph.fgm" using 1:5 title "Coolant" with points
INPUT
