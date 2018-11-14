#!/bin/bash
rm plot.dat
rm alldata.dat


readgpu(){
while true; do 
nvidia-smi | grep 1992MiB | cut -d "|" -f 3 | cut -d "/" -f 1 | cut -d M -f 1 >> alldata.dat
sleep 1;
done
}
writedat(){
while true; do
tail -n 100 alldata.dat > plot.dat
sleep 1;
done
}
#writedata &
readgpu &
writedat &
sleep 1
gnuplot plotgpu.gnu

