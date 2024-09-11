# 统计附件1中违约、未违约的公司信息
import csv
import xlwt
import xlrd

file=open('附件1企业信息.csv','r')
lines=file.readlines()  
file.close()
rows = []  
for line in lines:  #先将csv文件中数据去除opponent后按行导入rows列表
    tmp = line.strip('\n')  #去掉readlines中包含的'/n'
    tmp = tmp.split(',') #split() 通过指定分隔符对字符串进行切片，如果参数 num 有指定值，则分隔 num+1 个子字符串
    rows.append(tmp)
del rows[0]

norebel=[]
rebel=[]
for row in rows:
    if row[3]=="否":
        norebel.append(row[0])
    else:
        rebel.append(row[0])

wb = xlwt.Workbook()
ws = wb.add_sheet("违约")
for i in range(len(norebel)):
    ws.write(i,0,norebel[i])
for i in range(len(rebel)):
    ws.write(i,1,rebel[i])
wb.save("违约.xls")
