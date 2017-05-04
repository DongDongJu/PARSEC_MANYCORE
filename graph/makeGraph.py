import sys
import numpy as np
import matplotlib.pyplot as plt
from pylab import *



def GetDataFromFile(f_n):
    file_name=f_n
    lines=open(file_name,"r")

    data_name=lines.readline()
    data=[]
    for line in lines:
        data.append(line.split())
    return data_name,data

if __name__ == "__main__":
    file_list=["blackscholes.txt","bodytrack.txt","canneal.txt","dedup.txt","ferret.txt","freqmine.txt","raytrace.txt","streamcluster.txt","swaptions.txt"]
    fig = plt.figure()
    for f_n in file_list:
        data_name,data=GetDataFromFile(f_n)
        index=[int(i[0]) for i in data]
        value=[float(i[1]) for i in data]
        plt.plot(index,value,label=data_name)
    plt.xlabel("number of threads")
    plt.ylabel("execution time")
    plt.grid(True)
    plt.legend()
    plt.show()
    fig.savefig("result_graph.png")

