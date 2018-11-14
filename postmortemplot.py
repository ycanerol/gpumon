#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""

"""

import matplotlib.pyplot as plt
import numpy as np

f = '/home/ycan/miscscripts/gpumon/alldata.dat'
lines = []
t = []
m = []

with open(f, 'r') as file:
    lines = file.readlines()

labels = lines[0]  # First line contains headers
labels = labels.split()

ncol = len(lines[1].split())

data = np.zeros((len(lines)-1, ncol))

for i, line in enumerate(lines):
    if i == 0: continue
    l = line.split()
    for col in range(ncol):
        data[i-1, col] = int(l[col])

plt.plot(data)
plt.legend(labels)
plt.xlabel('Time [s]')
plt.ylabel('Memory use [MiB]')
plt.show()
