Sub ReadData()

Dim NameHeader As Range
Dim AdrsHeader As Range
Dim NameRange As Range
Dim NameCount As Integer
Dim AdrsRange As Range
Dim AdrsCount As Integer
Dim i As Integer

Dim objOutlook As Object
Dim Msg As Object

    Cells.Find(What:="First Name", After:=ActiveCell, LookIn:=xlFormulas, LookAt _
        :=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:= _
        True, SearchFormat:=False).Activate
    Set NameHeader = Selection
    NameHeader.Offset(1, 0).Select
    Range(Selection, Selection.End(xlDown)).Select
    Set NameRange = Selection
    NameCount = NameRange.Rows.Count
    
    
    Cells.Find(What:="Email", After:=ActiveCell, LookIn:=xlFormulas, LookAt _
        :=xlPart, SearchOrder:=xlByRows, SearchDirection:=xlNext, MatchCase:= _
        True, SearchFormat:=False).Activate
    Set AdrsHeader = Selection
    AdrsHeader.Offset(1, 0).Select
    Range(Selection, Selection.End(xlDown)).Select
    Set AdrsRange = Selection
    AdrsCount = NameRange.Rows.Count
    
    NameHeader.Offset(1, 0).Select
    
    
For i = 1 To NameCount
    
    Set objOutlook = CreateObject("Outlook.Application")
    Set Msg = objOutlook.CreateItem(0)
    
    With Msg
     .to = "someone@something.com;"
     .Subject = "What are you sending this for"
     .HTMLBody "Whatever you whant to say"
     .send
    End With

Next i

End Sub