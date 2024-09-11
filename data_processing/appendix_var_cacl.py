# 计算附件1/2各公司17-19年间的年利润率方差
import csv
import pandas as pd
import numpy as np
import xlwt
import xlrd
from xlutils.copy import copy


file=open('附件1各年利润率信息统计.csv','r')
lines=file.readlines()  
file.close()
rows = []  

for line in lines:  #先将csv文件中数据去除opponent后按行导入rows列表
    tmp = line.strip('\n')  #去掉readlines中包含的'/n'
    tmp = tmp.split(',') #split() 通过指定分隔符对字符串进行切片，如果参数 num 有指定值，则分隔 num+1 个子字符串
    rows.append(tmp)

var=[]
for row in rows:
    flag1=int(row[0]=="0") + int(row[1]=="0") + int(row[2]=="0")
    flag2=int(row[3]=="0") + int(row[4]=="0") + int(row[5]=="0")
    if flag1>=2 or flag2>=2:
        var.append("invalid")
    else:
        tmp=[]
        if row[0]!="0" and row[3]!="0":
            pro_r17=(float(row[3])-float(row[0]))/float(row[3])
            tmp.append(pro_r17)
        if row[1]!="0" and row[4]!="0":
            pro_r18=(float(row[4])-float(row[1]))/float(row[4])
            tmp.append(pro_r18)
        if row[2]!="0" and row[5]!="0":
            pro_r19=(float(row[5])-float(row[2]))/float(row[5])
            tmp.append(pro_r19)
        tmp=np.array(tmp)
        var.append(np.var(tmp))


wb = xlwt.Workbook()
ws = wb.add_sheet("附件1年利润方差")
for i in range(len(var)):
    ws.write(i,0,var[i])
wb.save("附件1各年利润方差.xls")
