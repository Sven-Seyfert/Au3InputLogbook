Func _exit()
    OnAutoItExitUnRegister( '_exit' )

    FileWrite( $hLogFile, @CRLF & '```')
    FileClose( $hLogFile )

    Exit
EndFunc
