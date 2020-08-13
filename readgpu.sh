#!/bin/bash
rm plot.dat
rm alldata.dat

# Parse the argument and make the header
prog=$1
echo $prog
header="Total $prog"
echo $header>alldata.dat


readgpu(){
while true; do
       # Read the total memory use
	towrite=$(nvidia-smi | grep /*MiB | head -1 | cut -d "|" -f 3|cut -d "M" -f 1 | cut -f-1| xargs)
	# Read the memory use of the specified program
       p=$(nvidia-smi | grep -i $prog | head -1 | cut -c 69-74|xargs)
       towrite="$towrite $p"
	echo $towrite>> alldata.dat
sleep 1;
done
}


writedat(){
while true; do
# Write the headers
towrite2=$(head -n 1 alldata.dat)
# Write the last 100 entries
towrite2="$towrite2\n$(tail -n +2 alldata.dat | tail -n 100)"
echo -e "$towrite2" > plot.dat
sleep 1;
done
}


readgpu 2>/dev/null & # Use & to wait for the command to return
writedat &
sleep 1
# Suppress the warnings and errors from gnuplot
gnuplot plotgpu.gnu 2>/dev/null

