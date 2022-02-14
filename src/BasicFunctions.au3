Func _Exit()
    OnAutoItExitUnRegister('_Exit')

    FileWrite($hLogFile, @CRLF & '```')
    FileClose($hLogFile)

    Exit
EndFunc
