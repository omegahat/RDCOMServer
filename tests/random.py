from win32com.client import Dispatch

o = Dispatch("RNG")
print o.normal(10)
