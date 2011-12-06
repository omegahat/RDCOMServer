Attribute VB_Name = "Module1"
Sub main()

 Dim s As String
 Dim x As Object
 Dim z As Integer

 s = "Duncan"

 Set x = CreateObject("StringRef")

 z = x.WithString(s)

End Sub
