*** Settings ***
Library     RequestsLibrary


*** Variables ***
${bese_url}                  http://restapi.demoqa.com
${city}                      Delhi
${Temperature}
${Humidity}
${WeatherDescription}
${WindSpeed}
${WindDirectionDegree}
${path}                      /utilities/weather/city/Delhi/

*** Test Cases ***
robotAPI
      Create Session    myssion    ${bese_url}
      ${response}=      Get Request    myssion       ${path}${city}
      # Log To Console     ${response.status_code}
      # Log To Console     ${response.content}
      # Log To Console     ${response.headers}

      #Validation
      ${status_code}=    convert to string     ${response.status_code}
      Should Be Equal    ${status_code}    200

      ${body}=      convert to string     ${response.content}
      Should Contain    ${body}    Delhi
