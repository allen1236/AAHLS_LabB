# coding: utf-8

# In[ ]:


from __future__ import print_function

from time import time
import sys, os
import struct

SIZE = 4

sys.path.append('/home/xilinx')
os.environ['XILINX_XRT'] = '/usr'
from pynq import Overlay



if __name__ == "__main__":
    print("Entry:", sys.argv[0])
    print("System argument(s):", len(sys.argv))

    print("Start of \"" + sys.argv[0] + "\"")

    ol = Overlay("/home/xilinx/jupyter_notebooks/spmv/spmv.bit")
    regIP = ol.spmv_0

    rowPtr = [0,2,4,7,9]
    columnIndex = [0,1,1,2,0,2,3,1,3]
    values = [3,4,5,9,2,3,1,4,6]
    x = [1,2,3,4]


    for i in range(len(rowPtr)):
        regIP.write(0x20 + 4*i, rowPtr[i])
    for i in range(len(columnIndex)):
        regIP.write(0x40 + 4*i, columnIndex[i])
    for i in range(len(values)):
        regIP.write(0x80 + 4*i, struct.pack('f', values[i]))
    for i in range(len(x)):
        regIP.write(0xc0 + 4*i, struct.pack('f', x[i]))
    regIP.write(0x00, 0x01)
    timeKernelStart = time()
    while (regIP.read(0x00) & 0x4) == 0x0:
        continue           
    timeKernelEnd = time()
    y = []

    print("Result")
    print("============================")

    for i in range(SIZE):
        res = regIP.read(0x10+4*i)
        res = struct.pack('i', res)
        res = struct.unpack('f', res)[0]
        print(res)
        y.append(res)
    
    print("============================")
    print(f"time: {timeKernelEnd-timeKernelStart}")
    print("Exit process")

