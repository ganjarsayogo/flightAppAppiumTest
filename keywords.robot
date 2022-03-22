*** Settings ***
Library                             AppiumLibrary

*** Keywords ***
Open Flight App Application
    Open Application            ${REMOTE_URL}	
    ...                         platformName=${PLATFORM_NAME}
    ...                         platformVersion=${PLATFORM_VERSION}
    ...                         deviceName=${DEVICE_NAME}
    ...                         appPackage=${APP_PACKAGE}
    ...                         appActivity=${APP_ACTIVITY}

Verify App component is shown
    Page Should Contain Element                 id=com.example.myapplication:id/imageView4
    Page Should Contain Element                 id=com.example.myapplication:id/login
    Page Should Contain Element                 id=com.example.myapplication:id/button5
    Page Should Contain Element                 xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.Button[3]
    Page Should Contain Element                 xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.Button[4]
    Page Should Contain Element                 id=com.example.myapplication:id/imageView
    Page Should Contain Element                 id=com.example.myapplication:id/textView4

Tap Sign In
    Wait Until Page Contains Element            id=com.example.myapplication:id/login
    Click Element                               id=com.example.myapplication:id/login

Input Wrong Username
    Wait Until Page Contains Element            id=com.example.myapplication:id/username
    Input Text                                  id=com.example.myapplication:id/username                    support1@ngendigital.com

Input Valid Username
    Wait Until Page Contains Element            id=com.example.myapplication:id/username
    Input Text                                  id=com.example.myapplication:id/username                    support@ngendigital.com

Input Valid Password
    Wait Until Page Contains Element            id=com.example.myapplication:id/password
    Input Text                                  id=com.example.myapplication:id/password                    abc123                      

Tap Submit Username & Password
    Wait Until Page Contains Element            id=com.example.myapplication:id/signIn
    Click Element                               id=com.example.myapplication:id/signIn

Verify Login Failed Message
    Wait Until Page Contains                    Invalid username/password

Verify Login Success
    Wait Until Page Contains Element            id=com.example.myapplication:id/textView

User Success to Login
    Open Flight App Application
    Wait Until Page Contains Element            id=com.example.myapplication:id/login                       60 seconds
    Click Element                               id=com.example.myapplication:id/login
    Wait Until Page Contains Element            id=com.example.myapplication:id/username                    60 seconds
    Input Text                                  id=com.example.myapplication:id/username                    support@ngendigital.com
    Wait Until Page Contains Element            id=com.example.myapplication:id/password                    60 seconds
    Input Text                                  id=com.example.myapplication:id/password                    abc123
    Wait Until Page Contains Element            id=com.example.myapplication:id/signIn                      60 seconds
    Click Element                               id=com.example.myapplication:id/signIn
    Wait Until Page Contains Element            id=com.example.myapplication:id/textView

Go To Book Page
    Wait Until Page Contains Element            id=com.example.myapplication:id/book                        60 seconds
    Click Element                               id=com.example.myapplication:id/book

Choose Flight Type
    [Arguments]                                 ${flig_type}
    Wait Until Page Contains Element            xpath=//android.support.v7.app.ActionBar.Tab[@content-desc="${flig_type}"]           60 seconds
    Click Element                               xpath=//android.support.v7.app.ActionBar.Tab[@content-desc="${flig_type}"]  

Choose Departure City
    [Arguments]                                 ${dept_city}
    Wait Until Page Contains Element            id=com.example.myapplication:id/spinnerFrom                 60 seconds
    Click Element                               id=com.example.myapplication:id/spinnerFrom
    Wait Until Page Contains                    ${dept_city}                                                60 seconds
    Click Text                                  ${dept_city}

Choose Destination City
    [Arguments]                                 ${dest_city}
    Wait Until Page Contains Element            id=com.example.myapplication:id/spinnerTo                   60 seconds
    Click Element                               id=com.example.myapplication:id/spinnerTo
    Wait Until Page Contains                    ${dest_city}                                                60 seconds
    Click Text                                  ${dest_city}

Choose Flight Class
    [Arguments]                                 ${flig_class}
    Wait Until Page Contains Element            id=com.example.myapplication:id/spinnerClass                60 seconds
    Click Element                               id=com.example.myapplication:id/spinnerClass
    Wait Until Page Contains                    ${flig_class}                                               60 seconds
    Click Text                                  ${flig_class}

Choose Start Date
    [Arguments]                                 ${sta_date}
    Wait Until Page Contains Element            id=com.example.myapplication:id/textStartDate               60 seconds
    Click Element                               id=com.example.myapplication:id/textStartDate
    Wait Until Page Contains                    "${sta_date}"                                               60 seconds
    Click Text                                  ${sta_date}
    Wait Until Page Contains Element            id=android:id/button1
    Click Text                                  OK

Choose End Date
    [Arguments]                                 ${end_date}
    Wait Until Page Contains Element            id=com.example.myapplication:id/textStartDate               60 seconds
    Click Element                               id=com.example.myapplication:id/textStartDate
    Wait Until Page Contains                    "${end_date}"                                               60 seconds
    Click Text                                  ${end_date}
    Wait Until Page Contains Element            id=android:id/button1
    Click Text                                  OK

Choose Flight Package 1
    Wait Until Page Contains Element            id=com.example.myapplication:id/radioButtonFlight           60 seconds
    Click Element                               id=com.example.myapplication:id/radioButtonFlight

Choose Flight Package 2
    Wait Until Page Contains Element            id=com.example.myapplication:id/radioButtonFlightHotel      60 seconds
    Click Element                               id=com.example.myapplication:id/radioButtonFlightHotel

Choose Day Package
    Wait Until Page Contains Element            id=com.example.myapplication:id/checkBoxDay                 60 seconds
    Click Element                               id=com.example.myapplication:id/checkBoxDay

Tap Book Order
    Wait Until Page Contains Element            id=com.example.myapplication:id/book_flight                 60 seconds
    Click Element                               id=com.example.myapplication:id/book_flight

Choose Price
    [Arguments]                                 ${idx_price}
    Wait Until Page Contains Element            id=com.example.myapplication:id/price${idx_price}           60 seconds
    Click Element                               id=com.example.myapplication:id/price${idx_price}

Tap Confirm Order
    Wait Until Page Contains Element            id=com.example.myapplication:id/confirm_order               60 seconds
    Click Element                               id=com.example.myapplication:id/confirm_order

Verify Book Flight Success
    Wait Until Page Contains Element            id=com.example.myapplication:id/checkedTextView             60 seconds

Go To Search Page
    Wait Until Page Contains Element            id=com.example.myapplication:id/search_flight               60 seconds
    Click Element                               id=com.example.myapplication:id/search_flight

Input Wrong Flight Number
    Wait Until Page Contains Element            id=com.example.myapplication:id/flight_number               60 seconds
    Input Text                                  id=com.example.myapplication:id/flight_number               DA934

Input Valid Flight Number
    Wait Until Page Contains Element            id=com.example.myapplication:id/flight_number               60 seconds
    Input Text                                  id=com.example.myapplication:id/flight_number               DA935

Tap Search
    Wait Until Page Contains Element            id=com.example.myapplication:id/searchFlight                60 seconds
    Click Element                               id=com.example.myapplication:id/searchFlight

Verify Search Flight Failed Message
    Wait Until Page Contains                    Please enter valid Flight Number                            60 seconds

Verify Search Flight Success
    Element Text Should Be                      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TableLayout/android.widget.TableRow[2]/android.widget.TextView[1]         DA 935
    #Wait Until Page Contains                    DA 935                                                      60 seconds
    #Wait Until Page Contains Element            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TableLayout/android.widget.TableRow[1]/android.widget.TextView[1]         60 seconds
    #Wait Until Page Contains Element            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TableLayout/android.widget.TableRow[1]/android.widget.TextView[2]         60 seconds
    #Wait Until Page Contains Element            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TableLayout/android.widget.TableRow[1]/android.widget.TextView[3]         60 seconds
    #Wait Until Page Contains Element            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TableLayout/android.widget.TableRow[1]/android.widget.TextView[4]         60 seconds
    #Wait Until Page Contains Element            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TableLayout/android.widget.TableRow[2]/android.widget.TextView[1]         60 seconds
    #Wait Until Page Contains Element            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TableLayout/android.widget.TableRow[2]/android.widget.TextView[2]         60 seconds
    #Wait Until Page Contains Element            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TableLayout/android.widget.TableRow[2]/android.widget.TextView[3]         60 seconds
    #Wait Until Page Contains Element            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TableLayout/android.widget.TableRow[2]/android.widget.TextView[4]         60 seconds