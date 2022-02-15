; compiler information for AutoIt
#pragma compile(CompanyName, © SOLVE SMART)
#pragma compile(FileVersion, 1.4.0)
#pragma compile(LegalCopyright, © Sven Seyfert)
#pragma compile(ProductName, GetCurrentPressedKeyCode)
#pragma compile(ProductVersion, 1.4.0 - 2022-02-14)

#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Icon=..\media\favicon.ico
#AutoIt3Wrapper_Outfile_x64=..\build\GetCurrentPressedKeyCode.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=y



; opt and just singleton -------------------------------------------------------
Opt( 'MustDeclareVars', 1 )
Global $aInst = ProcessList( 'GetCurrentPressedKeyCode.exe' )
If $aInst[0][0] > 1 Then Exit



; processing -------------------------------------------------------------------
HotKeySet('{ESC}', '_Exit')

While True
    For $i = 1 To 255 Step 1
        Global $sHexKeyCode = Hex($i, 2)

        If _IsKeyPressed($sHexKeyCode) Then
            ConsoleWrite($sHexKeyCode & @CRLF)
        EndIf
    Next

    Sleep(10)
WEnd



; functions --------------------------------------------------------------------
Func _Exit()
    Exit
EndFunc

Func _IsKeyPressed($sKeyHexCode)
    Local $aReturn = DllCall('user32.dll', 'short', 'GetAsyncKeyState', 'int', '0x' & $sKeyHexCode)

    Return BitAND($aReturn[0], 0x8000) <> 0
EndFunc
