#/usr/bin/python
#-*- coding:utf-8 - *-

import sys
import os
import csv


def countInjection():
	#先获得当前文件夹下所有csv文件
	fileList = os.listdir()
	csvList = list()
	for i in fileList:
		if ".csv" in i:
			#print(i)
			csvList.append(i)
	result = 0
	rowNum = 0
	for i in csvList:
		with open(i) as f:
			f_csv = csv.reader(f)
			headers = next(f_csv)
			for row in f_csv:
				if "code snippet injection" in row:
					result += 1
				rowNum += 1
	#print(csvList)
	print(len(csvList))
	print(result, rowNum, result/rowNum)
	return

countInjection()