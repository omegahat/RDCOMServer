
# c:/Python22/python < rcom.py 
from win32com.client import Dispatch
o = Dispatch("SNormal")

print o

x = o.deviate
print x

