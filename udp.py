from decimal import Decimal

import socket
import csv
import operator
import numpy as np
UDP_IP = "127.0.0.1"
UDP_PORT = 12345
f1 = open("akkibotheye1.csv", "wb")
f2 = open("akkibotheye3.csv", "wb")
f3 = open("akkibotheye5.csv", "wb")
f4 = open("akkibotheye7.csv", "wb")

count = 0;


sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))
print "hello"
while True:
   count=count+1
   data1,addr = sock.recvfrom(1024)
   data2,addr = sock.recvfrom(1024)
   data3,addr = sock.recvfrom(1024)
   data4,addr = sock.recvfrom(1024)
   data_new1 = data1[1:-1]
   data_new2 = data2[1:-1]
   data_new3 = data3[1:-1]
   data_new4 = data4[1:-1]
   # data1_array = np.array(data_new1)
   #plt.plot(count, int(data_new1[3]))
   #plt.pause(0.05)
   #pg.plot(count, data_new1[2])
   print count
   #print (data1_array[3])
   f1.write(data_new1)
   f1.write('\n')
   f2.write(data_new2)
   f2.write('\n')
   f3.write(data_new3)
   f3.write('\n')
   f4.write(data_new4)
   f4.write('\n')
   if(count == 3000):
      break
   
   
    
sock.close();   
   

