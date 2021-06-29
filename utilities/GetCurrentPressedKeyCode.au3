HotKeySet( '{ESC}', '_exit' )

Func _exit()
    Exit
EndFunc

Func _isKeyPressed( $sKeyHexCode )
    Local $aReturn = DllCall( 'user32.dll', 'short', 'GetAsyncKeyState', 'int', '0x' & $sKeyHexCode )
    Return BitAND( $aReturn[0], 0x8000 ) <> 0
EndFunc

While 1
    For $i = 1 To 255 Step 1
        Global $sHexKeyCode = Hex( $i, 2 )
        If _isKeyPressed( $sHexKeyCode ) Then ConsoleWrite( $sHexKeyCode & @CRLF )
    Next

    Sleep( 10 )
WEnd