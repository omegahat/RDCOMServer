Attribute VB_Name = "testLong"

Sub Main()
 Dim obj As Object
 Dim x As Double


 Set obj = CreateObject("longComp")
 
 x = obj.Get
 
 MsgBox CStr(x)
 
 MsgBox "Doing the computation"
 obj.Count
End Sub
