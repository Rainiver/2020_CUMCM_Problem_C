#提取附件2/1中进行、销项发票中各公司流水信息的时间跨度（按月计）
import csv
import pandas as pd
import numpy as np
import xlwt
import xlrd
from xlutils.copy import copy


file=open('附件2销项发票.csv','r')
lines=file.readlines()  
file.close()
rows = []  

for line in lines:  #先将csv文件中数据去除opponent后按行导入rows列表
    tmp = line.strip('\n')  #去掉readlines中包含的'/n'
    tmp = tmp.split(',') #split() 通过指定分隔符对字符串进行切片，如果参数 num 有指定值，则分隔 num+1 个子字符串
    rows.append(tmp)
del rows[0]

id=124
tmplist=[]
companies=[]
for row in rows:  #将每个公司的数据编成列表储存在所有公司数据的列表companies中
    if row[0]=="E"+str(id) :
        tmplist.append(row)
    else :
        companies.append(tmplist)
        tmplist=[]
        tmplist.append(row)
        id+=1
companies.append(tmplist)


time=[]
for company in companies:
    for index,row in enumerate(company):
        if index==0:
            tmp1=row[2].split("/")
        if index==len(company)-1:
            tmp2=row[2].split("/")
    month1 = (int(tmp1[0])-1)*12 + int(tmp1[1])
    month2 = (int(tmp2[0])-1)*12 + int(tmp2[1])
    time.append(month2 - month1+1)

wb = xlwt.Workbook()
ws = wb.add_sheet("附件2月份数")
for i in range(len(time)):
    ws.write(i,0,time[i])
wb.save("附件2月份数统计.xls")

file=open('附件2进项发票.csv','r')
lines=file.readlines()  
file.close()
rows = []  

for line in lines:  #先将csv文件中数据去除opponent后按行导入rows列表
    tmp = line.strip('\n')  #去掉readlines中包含的'/n'
    tmp = tmp.split(',') #split() 通过指定分隔符对字符串进行切片，如果参数 num 有指定值，则分隔 num+1 个子字符串
    rows.append(tmp)
del rows[0]

id=124
tmplist=[]
companies=[]
for row in rows:  #将每个公司的数据编成列表储存在所有公司数据的列表companies中
    if row[0]=="E"+str(id) :
        tmplist.append(row)
    else :
        companies.append(tmplist)
        tmplist=[]
        tmplist.append(row)
        id+=1
companies.append(tmplist)


time=[]
for company in companies:
    for index,row in enumerate(company):
        if index==0:
            tmp1=row[2].split("/")
        if index==len(company)-1 :
            tmp2=row[2].split("/")
    month1 = (int(tmp1[0])-1)*12 + int(tmp1[1])
    month2 = (int(tmp2[0])-1)*12 + int(tmp2[1])
    time.append(month2 - month1+1)

old_workbook = xlrd.open_workbook("附件2月份数统计.xls")
workbook = copy(old_workbook)
worksheet = workbook.get_sheet(0)
for i in range(len(time)):
    worksheet.write(i,1,time[i])
workbook.save("附件2月份数信息统计.xls")
