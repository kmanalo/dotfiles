#!/bin/awk -f

# awk script returns all lines between start and end pattern lines
#  start pattern line included 
# end pattern line is NOT included (by design)

# note: awk '$0 ~' needed in order for variables 's' and 'e' to 
#  be substituted into this script

### begin awking

$0 ~ s { start = 1 }
# if statement is needed to prevent premature exit
$0 ~ e { if (start == 1) exit; start = 0 }
start == 1 { print $0 }

### end awking

