set xrange [0:120]
set yrange [200:2000]
set xlabel "Time (s)"
set ylabel "Used GPU Memory (MB)"
set title "GPU Monitor"
set key off
plot "plot.dat" using 1 with lines
pause 1
reread
