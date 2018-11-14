set xrange [0:120]
set yrange [200:2000]
set xlabel "Time (s)"
set ylabel "Used GPU Memory (MB)"
set title "GPU Monitor"
#set key off
plot for [col=1:2] "plot.dat" using col with lines title columnheader
pause 1
reread
