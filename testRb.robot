*** Settings ***
Variables   data/test-data.yaml
Library    DateTime
Library    XML
Library    OperatingSystem
Library    Dialogs

*** Test Cases ***
TC1
    [Tags]    Test
    &{my_dict}      Create Dictionary   name=${student.me.name}   id=${student.me.id}     age=${student.me.age}
    &{her_dict}      Create Dictionary   name=${student.her.name}   id=${student.her.id}     age=${student.her.age}
    ${list_test}    Create List     ${my_dict}   ${her_dict}
#    Log     ${list_test}

TC2
    [Tags]    Test1
    ${test_start}       Get Current Date    exclude_millis=yes
    Log    ${test_start}

TC3
    [Tags]    Test_Xml
    ${file}=    Get File    ${CURDIR}/data/test-xml-data.xml
    ${xml_content}=    Parse Xml    ${file}
    ${ele}=     Get Element    ${xml_content}    xpath=third
#    Execute Manual Step    Stop at this time
    Log Element    ${ele}

*** Keywords ***
My keyword
    [Arguments]
    FOR    ${element}    IN    @{LIST}
        Log    ${element}

    END
