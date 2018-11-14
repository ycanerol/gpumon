#!/bin/bash
rm plot.dat
rm alldata.dat

readgpu(){
while true; do 
nvidia-smi | grep /*MiB | head -1 | cut -d "|" -f 3|cut -d "M" -f 1 | cut -f-1| xargs >> alldata.dat
sleep 1;
done
}
writedat(){
while true; do
tail -n 100 alldata.dat > plot.dat
sleep 1;
done
}
readgpu & # Use & to wait for the command to return
writedat &
sleep 1
gnuplot plotgpu.gnu

