
refline_plus1=$(wc prb.ref | tr -s " " | cut -d' ' -f2)
refline=$((refline_plus1 - 1))

# if meshtal does not exist exit !
#  support condition here

if [ -e meshtal.presplit ] ; then
  echo meshtal.presplit file already created, skipping...
else
  awk '/Rel Error/{f=1;;next}f&&/Total/{exit}f' meshtal > meshtal.presplit
fi

talline=$(wc meshtal.presplit | tr -s " " | cut -d' ' -f2)

echo $refline
echo $talline

groups_plus1=$(($talline/$refline))
groups=$((groups_plus1 - 1))
echo $groups

split -a 3 -d -l $refline meshtal.presplit

for i in $(seq 0 $groups); do
    j=$((i+1))
    #echo "  Group       Coarse      Material    x-cm        y-cm        z-cm        Phi0        Phi1        Phi11cos    Phi11sin" > prb$j.flx
    if [ $j -le 10 ] ; then
      paste -d ' ' prb.ref <(echo; eval cat x00$i | tr -s " " | cut -d' ' -f6) >> prb$j.flx
    elif [ $j -le 100 ] ; then 
      paste -d ' ' prb.ref <(echo; eval cat x0$i | tr -s " " | cut -d' ' -f6) >> prb$j.flx
    else
      paste -d ' ' prb.ref <(echo; eval cat x$i | tr -s " " | cut -d' ' -f6) >> prb$j.flx
    fi
done
