; compiler information for AutoIt
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Icon=..\media\favicon.ico
#AutoIt3Wrapper_Outfile_x64=..\build\Au3InputLogbook.exe
#AutoIt3Wrapper_Res_Description=Au3InputLogbook (2021-07-07)
#AutoIt3Wrapper_Res_Fileversion=0.3
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=y



; opt and just singleton -------------------------------------------------------
Opt( 'MustDeclareVars', 1 )
Global $aInst = ProcessList( 'Au3InputLogbook.exe' )
If $aInst[0][0] > 1 Then Exit



; includes ---------------------------------------------------------------------
#include-once



; references -------------------------------------------------------------------
#include "Declaration.au3"
#include "Init.au3"
#include "Functions.au3"
#include "BasicFunctions.au3"



; processing -------------------------------------------------------------------
While True
    Select
        ; Ctrl + Alt
        Case _isKeyPressed( '11' ) And _isKeyPressed( '12' )
            _wasKeyOfKeyTypePressed( $aAltKeys )

        ; Shift
        Case _isKeyPressed( '10' )
            While _isKeyPressed( '10' )
                _wasKeyOfKeyTypePressed( $aAlphabetKeys, 1 )
                _wasKeyOfKeyTypePressed( $aUmlautKeys, 1 )
                _wasKeyOfKeyTypePressed( $aShiftKeys )
            WEnd

        ; Ctrl
        Case _isKeyPressed( '11' )
            While _isKeyPressed( '11' )
                _wasKeyOfKeyTypePressed( $aAlphabetKeys, 2 )
            WEnd

        ; Alt
        Case _isKeyPressed( '12' )
            While _isKeyPressed( '12' )
                _wasKeyOfKeyTypePressed( $aAltKeys )
            WEnd

        Case Else
            _wasKeyOfKeyTypePressed( $aFKeys )
            _wasKeyOfKeyTypePressed( $aNumberKeys )
            _wasKeyOfKeyTypePressed( $aNumpadKeys )
            _wasKeyOfKeyTypePressed( $aCalcKeys )
            _wasKeyOfKeyTypePressed( $aAlphabetKeys )
            _wasKeyOfKeyTypePressed( $aUmlautKeys )
            _wasKeyOfKeyTypePressed( $aNavKeys )
            _wasKeyOfKeyTypePressed( $aControlKeys )
            _wasKeyOfKeyTypePressed( $aSpecialCharKeys )
    EndSelect
WEnd
