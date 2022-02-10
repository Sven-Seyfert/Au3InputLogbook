; compiler information for AutoIt
#pragma compile(CompanyName, © SOLVE SMART)
#pragma compile(FileVersion, 1.3.0)
#pragma compile(LegalCopyright, © Sven Seyfert)
#pragma compile(ProductName, Au3InputLogbook)
#pragma compile(ProductVersion, 1.3.0 - 2022-02-10)

#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Icon=..\media\favicon.ico
#AutoIt3Wrapper_Outfile_x64=..\build\Au3InputLogbook.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=y



; opt and just singleton -------------------------------------------------------
Opt('MustDeclareVars', 1)
Global $aInst = ProcessList('Au3InputLogbook.exe')
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
        ; Ctrl+Alt or Ctrl
        Case _isKeyPressed('11')
            While _isKeyPressed('11')
                If _isKeyPressed('12') Then
                    _wasKeyOfKeyTypePressed($aAltKeys)
                Else
                    _wasKeyOfKeyTypePressed($aAlphabetKeys, 2)
                EndIf
            WEnd

        ; Shift
        Case _isKeyPressed('10')
            While _isKeyPressed('10')
                _wasKeyOfKeyTypePressed($aAlphabetKeys, 1)
                _wasKeyOfKeyTypePressed($aUmlautKeys, 1)
                _wasKeyOfKeyTypePressed($aShiftKeys)
            WEnd

        ; Alt
        Case _isKeyPressed('12')
            While _isKeyPressed('12')
                _wasKeyOfKeyTypePressed($aAltKeys)
            WEnd

        Case Else
            _wasKeyOfKeyTypePressed($aFKeys)
            _wasKeyOfKeyTypePressed($aNumberKeys)
            _wasKeyOfKeyTypePressed($aNumpadKeys)
            _wasKeyOfKeyTypePressed($aCalcKeys)
            _wasKeyOfKeyTypePressed($aAlphabetKeys)
            _wasKeyOfKeyTypePressed($aUmlautKeys)
            _wasKeyOfKeyTypePressed($aNavKeys)
            _wasKeyOfKeyTypePressed($aControlKeys)
            _wasKeyOfKeyTypePressed($aSpecialCharKeys)
    EndSelect
WEnd
