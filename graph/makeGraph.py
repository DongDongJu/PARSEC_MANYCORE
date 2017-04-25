import sys
import numpy as np
import matplotlib.pyplot as plt
from pylab import *

def GetDataFromFile():
    if len(sys.argv) is 1:
        print "plz input data file path"
        sys.exit()

    file_name=sys.argv[1]
    lines=open(file_name,"r")

    data_name=lines.readline()
    data=[]
    for line in lines:
        data.append(line.split())
    return data_name,data

if __name__ == "__main__":
    fig = plt.figure()
    data_name,data=GetDataFromFile()

    index=[int(i[0]) for i in data]
    value=[float(i[1]) for i in data]
    print index,value
    plt.xlabel("number of threads")
    plt.ylabel("execution time")
    plt.grid(True)
    plt.plot(index,value)
    plt.show()
    fig.savefig(str(data_name.strip()+".png"))
    print data_name,index,value


