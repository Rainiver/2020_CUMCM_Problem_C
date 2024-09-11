#提取附件2/1进项和销项发票中反映的各公司17-19年总金额
import csv
import pandas as pd
import numpy as np
import xlwt
import xlrd
from xlutils.copy import copy


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


pro17=[]
pro18=[]
pro19=[]
for company in companies:
    tmp17,tmp18,tmp19=0.0,0.0,0.0
    for row in company:
        if "2019/" in row[2]:
            tmp19+=float(row[4])
        if "2018/" in row[2]:
            tmp18+=float(row[4])
        if "2017/" in row[2]:
            tmp17+=float(row[4])
    pro17.append(tmp17)
    pro18.append(tmp18)
    pro19.append(tmp19)

wb = xlwt.Workbook()
ws = wb.add_sheet("附件2各年利润")
for i in range(len(pro17)):
    ws.write(i,0,pro17[i])
for i in range(len(pro18)):
    ws.write(i,1,pro18[i])
for i in range(len(pro19)):
    ws.write(i,2,pro19[i])
wb.save("附件2各年利润率.xls")


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


pro17=[]
pro18=[]
pro19=[]
for company in companies:
    tmp17,tmp18,tmp19=0.0,0.0,0.0
    for row in company:
        if "2019/" in row[2]:
            tmp19+=float(row[4])
        if "2018/" in row[2]:
            tmp18+=float(row[4])
        if "2017/" in row[2]:
            tmp17+=float(row[4])
    pro17.append(tmp17)
    pro18.append(tmp18)
    pro19.append(tmp19)
#list2 = []
#for (i,j) in zip(buy,tax):
    #list2.append(i)
    #list2.append(j)
#a = np.array(list2).reshape(len(buy),2)
#np.savetxt('new.csv',a, delimiter = ',')


old_workbook = xlrd.open_workbook("附件2各年利润率.xls")
workbook = copy(old_workbook)
worksheet = workbook.get_sheet(0)
for i in range(len(pro17)):
    worksheet.write(i,3,pro17[i])
for i in range(len(pro18)):
    worksheet.write(i,4,pro18[i])
for i in range(len(pro19)):
    worksheet.write(i,5,pro19[i])
workbook.save("附件2各年利润率信息统计.xls")
