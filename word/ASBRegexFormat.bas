Sub ASBStatmentFormat()
    Dim strTemp As String
    Dim lastRow As Long
    lastRow = ActiveDocument.BuiltInDocumentProperties("Number Of Lines")

'############# isolate dates  and create seperate lines
    'ActiveDocument.Range(0, 0).Select
    'Selection.HomeKey Unit:=wdCharacter
    'Selection.EndKey Unit:=wdLine
    
    'Find instance with regex and replace
    For i = 1 To lastRow
        Selection.Find.ClearFormatting
        With Selection.Find
            .MatchWildcards = True
            .Text = "([0-9]{2})-([0-9]{2}) ([0-9]{2})-([0-9]{2})"
            .Forward = False
            .Execute
            strTemp = Selection
            .Wrap = wdFindContinue
            .Replacement.Text = Chr(13) + strTemp + ","
            .Execute Replace:=wdReplaceOne
        End With
        'clear strTemp
        strTemp = ""
    'Next instance
    Next i
    
    'Delete extra top line
    Selection.Delete Unit:=wdCharacter, Count:=1
    
    'reset line count
    lastRow = ActiveDocument.BuiltInDocumentProperties("Number Of Lines")
    
    'reset cursor
    ActiveDocument.Range(0, 0).Select
    
'isolate dollar amounts
    For i = 1 To lastRow
        Selection.Find.ClearFormatting
        With Selection.Find
            .MatchWildcards = True
            .Text = "$"
            .Forward = False
            .Execute
            strTemp = Selection
            .Wrap = wdFindContinue
            .Replacement.Text = ", $"
            .Execute Replace:=wdReplaceOne
        End With
        'clear strTemp
        strTemp = ""
    'Next instance
    Next i
    
    'reset cursor
    ActiveDocument.Range(0, 0).Select
    
'Delete massive numbers
    'Selection.HomeKey Unit:=wdLine
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    With Selection.Find
        .Text = "([0-9 ]{25})"
        .Replacement.Text = " "
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchAllWordForms = False
        .MatchSoundsLike = False
        .MatchWildcards = True
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
 
    'reset cursor
    ActiveDocument.Range(0, 0).Select
 
'Delte straggler numbers
    'Selection.HomeKey Unit:=wdLine
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    With Selection.Find
        .Text = "([ ])([0-9])([ ])"
        .Replacement.Text = " "
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchAllWordForms = False
        .MatchSoundsLike = False
        .MatchWildcards = True
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
End Sub