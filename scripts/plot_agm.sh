#!/bin/bash

gnuplot << INPUT
set term png 
set output "agm.png"
set xlabel "Forward Groups"
set ylabel "Adjoint Importance"
set title "Importance vs. Forward Group for each Material"
plot "graph.agm" using 1:2 title "Fuel" with points, \
     "graph.agm" using 1:3 title "Clad" with points, \
     "graph.agm" using 1:5 title "Coolant" with points, \
     "graph.agm" using 1:6 title "Adjoint Fission Source" with points
INPUT
