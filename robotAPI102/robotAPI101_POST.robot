*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${bese_url}      http://restapi.demoqa.com/customer
${path}          /register
*** Test Cases ***
robotAPI101_POST
      Create Session    mysession    ${bese_url}
      ${body}=     Create Dictionary
      ...    FirstName=david1234
      ...    LastName=david1234
      ...    UserName=david1234
      ...    Password=david1234
      ...    Email=david1234@gmail.com
      ${header}=     Create Dictionary      content-type=application/json
      ${response}=    Post Request     mysession     ${path}    data=${body}     headers=${header}

      Log To Console      ${response.status_code}
      Log To Console      ${response.content}
      Log To Console      ${response.headers}

      #validation
      ${status_code}=     Convert To String    ${response.status_code}
      Should Contain    ${status_code}    200
      ${res_body}=     Convert To String    ${response.content}
      Should Contain    ${res_body}    User already exists
      Should Contain    ${res_body}    FAULT_USER_ALREADY_EXISTS
