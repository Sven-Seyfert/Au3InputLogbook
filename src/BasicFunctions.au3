Func _exit()
    OnAutoItExitUnRegister( '_exit' )
    FileClose( $hLogFile )

    Exit
EndFunc
