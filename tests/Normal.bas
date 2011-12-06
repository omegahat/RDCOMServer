Attribute VB_Name = "Module1"
Sub Main()

Dim x As Object
Dim a() As Double
Dim v As Variant

  Set x = CreateObject("Normal")
  Debug.Print x.deviate()

   Debug.Print x.sample(1)
   
   Debug.Print x.percentile(0)
   Debug.Print x.quantile(0.5)
   
   v = x.sample(3)
   Debug.Print TypeName(v)
   Debug.Print v(1)
   Debug.Print UBound(v)
   Debug.Print LBound(v)
   
   For i = LBound(v) To UBound(v)
      Debug.Print v(i)
   Next i

End Sub
