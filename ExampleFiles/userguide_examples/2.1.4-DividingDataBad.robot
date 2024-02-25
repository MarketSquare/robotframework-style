*** Comments ***
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#rules-for-parsing-the-data


*** Settings ***
Documentation      Here we have documentation for this suite.\nDocumentation is often quite long.\n\nIt can also contain multiple paragraphs.
Default Tags       default tag 1    default tag 2    default tag 3    default tag 4    default tag 5

*** Variables ***
${STRING}          This is a long string. It has multiple sentences. It does not have newlines.
${MULTILINE}       This is a long multiline string.\nThis is the second line.\nThis is the third and the last line.
@{LIST}            this     list     is    quite    long     and    items in it can also be long
&{DICT}            first=This value is pretty long.    second=This value is even longer. It has two sentences.

*** Test Cases ***
Example
    [Tags]    you    probably    do    not    have    this    many    tags    in    real    life
    Do X    first argument    second argument    third argument    fourth argument    fifth argument    sixth argument
    ${var} =    Get X    first argument passed to this keyword is pretty long    second argument passed to this keyword is long too

*** Keywords ***
Do X
    [Arguments]    @{args}
    Log Many    @{args}

Get X
    [Arguments]    @{args}
    RETURN     @{args} 