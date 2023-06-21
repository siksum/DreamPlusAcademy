import glob
import os

prefix = r"/Users/jeongdaeyong/Desktop/Vulnerable-SC/v0.7/"
li = glob.glob("/Users/jeongdaeyong/Desktop/Vulnerable-SC/v0.7/*.sol")

for old_name in li:
    new_name = old_name.replace("v0.8.13", "v0.7.6")
    os.rename(old_name, new_name)
    print(new_name)
