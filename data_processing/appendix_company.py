#提取附件1/2上下游公司在表格中出现的频数信息
import csv
import pandas as pd
import numpy as np
import xlwt
import xlrd
from xlutils.copy import copy

file=open('附件1销项发票.csv','r')
lines=file.readlines()  
file.close()
rows = []  
for line in lines:  #先将csv文件中数据去除opponent后按行导入rows列表
    tmp = line.strip('\n')  #去掉readlines中包含的'/n'
    tmp = tmp.split(',') #split() 通过指定分隔符对字符串进行切片，如果参数 num 有指定值，则分隔 num+1 个子字符串
    rows.append(tmp)
del rows[0]


company_list=[]
number_list=[]
for row in rows:
    if row[3] not in company_list:
        company_list.append(row[3])
        number_list.append(1)
    else:
        loc = company_list.index(row[3])
        number_list[loc]+=1


#wb = xlwt.Workbook()
#ws = wb.add_sheet("上游公司")
#for i in range(len(company_list)):
    #ws.write(i,0,company_list[i])
    #ws.write(i,1,number_list[i])
#wb.save("上游公司频数信息.xls")
old_workbook = xlrd.open_workbook("上游公司频数信息.xls")
workbook = copy(old_workbook)
worksheet = workbook.get_sheet(0)
for i in range(len(company_list)):
    worksheet.write(i,2,company_list[i])
    worksheet.write(i,3,number_list[i])
workbook.save("附件1上下游公司频数信息.xls")

