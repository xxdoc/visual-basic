'define some ranges

Dim rng As Range
Dim rngTrgt As Range

'set those ranges

Set rng = Application.InputBox("Select a range", "Obtain Range Object", Type:=8)
Set rngTrgt = rng.Cells(1, 1)

'define some ints
    
Dim rowCount As Integer
Dim cellCount As Integer
    
'store the row and cell count of the range
    
rowCount = rng.Rows.Count
cellCount = rng.Cells.Count

MsgBox rowCount
MsgBox cellCount
