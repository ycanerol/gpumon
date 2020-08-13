#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""

"""

import matplotlib.pyplot as plt
import numpy as np
import glob

f = '/home/ycan/miscscripts/gpumon/alldata_2018-11-20+*'
lines = []
t = []
m = []

fname = glob.glob(f)[0]

with open(fname, 'r') as file:
    lines = file.readlines()

labels = lines[0]  # First line contains headers
labels = labels.split()

ncol = len(lines[1].split())

data = np.zeros((len(lines)-1, ncol))

for i, line in enumerate(lines):
    if i == 0: continue
    l = line.split()
    for col in range(ncol):
        try:
            data[i-1, col] = int(l[col])
        except IndexError:
            data[i-1, col] = 0

t = np.arange(0, data.shape[0])/60
plt.plot(t, data)
plt.legend(labels)
plt.xlabel('Time [min]')
plt.ylabel('Memory use [MiB]')
plt.show()


plt.plot(t, -np.diff(data))
plt.show()