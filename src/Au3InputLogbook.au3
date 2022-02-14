; compiler information for AutoIt
#pragma compile(CompanyName, © SOLVE SMART)
#pragma compile(FileVersion, 1.4.0)
#pragma compile(LegalCopyright, © Sven Seyfert)
#pragma compile(ProductName, Au3InputLogbook)
#pragma compile(ProductVersion, 1.4.0 - 2022-02-14)

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
        Case _IsKeyPressed('11')
            While _IsKeyPressed('11')
                If _IsKeyPressed('12') Then
                    _WasKeyOfKeyTypePressed($aAltKeys)
                Else
                    _WasKeyOfKeyTypePressed($aAlphabetKeys, 2)
                EndIf
            WEnd

        ; Shift
        Case _IsKeyPressed('10')
            While _IsKeyPressed('10')
                _WasKeyOfKeyTypePressed($aAlphabetKeys, 1)
                _WasKeyOfKeyTypePressed($aUmlautKeys, 1)
                _WasKeyOfKeyTypePressed($aShiftKeys)
            WEnd

        ; Alt
        Case _IsKeyPressed('12')
            While _IsKeyPressed('12')
                _WasKeyOfKeyTypePressed($aAltKeys)
            WEnd

        Case Else
            _WasKeyOfKeyTypePressed($aFKeys)
            _WasKeyOfKeyTypePressed($aNumberKeys)
            _WasKeyOfKeyTypePressed($aNumpadKeys)
            _WasKeyOfKeyTypePressed($aCalcKeys)
            _WasKeyOfKeyTypePressed($aAlphabetKeys)
            _WasKeyOfKeyTypePressed($aUmlautKeys)
            _WasKeyOfKeyTypePressed($aNavKeys)
            _WasKeyOfKeyTypePressed($aControlKeys)
            _WasKeyOfKeyTypePressed($aSpecialCharKeys)
    EndSelect
WEnd
