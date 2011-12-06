
# c:/Python22/python < rcom.py 
from win32com.client import Dispatch
o = Dispatch("Normal")
#o = Dispatch("{D9972BC3-F8CD-4079-8DA7-11693DF8162C}")

# This ends up calling an R function.
#print o

x = o.deviate()
print x

