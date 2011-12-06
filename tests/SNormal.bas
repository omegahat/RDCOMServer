Attribute VB_Name = "Module1"
Sub Main()

Dim x As Object
Dim a() As Double
Dim v As Variant

  Set x = CreateObject("SNormal")
  Debug.Print x.deviate()
   
   v = x.sample(3, mu = 100)

   Debug.Print TypeName(v)
   Debug.Print v(1)
   Debug.Print UBound(v)
   Debug.Print LBound(v)
   
   For i = LBound(v) To UBound(v)
      Debug.Print v(i)
   Next i

End Sub
