*** Settings ***
Documentation           FlightApp Test Cases
Library                 AppiumLibrary
Resource                keywords.robot
Test Setup              Open Flight App Application
Test Teardown           Close Application       

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     8.1
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          com.example.myapplication
${APP_ACTIVITY}         com.example.myapplication.MainActivity
${appWaitForLaunch}     false
${adbExecTimeout}       50000

*** Test Cases ***

4. User Success to Book a Flight
    [Setup]                                 User Success to Login
    Go To Book Page
    Choose Flight Type                      flig_type=Round Trip        #Choose: One Way or Round Trip
    Choose Departure City                   dept_city=Chicago           #Choose: New York, Chicago, or Toronto
    Choose Destination City                 dest_city=Paris             #Choose: London, Paris, or Ottawa
    Choose Flight Class                     flig_class=Business         #Choose: Economy, First, or Business
    Choose Start Date                       sta_date=21                 #the month are August 2019, choose any date between 1 until 31
    Choose End Date                         end_date=24                 #the month are August 2019, choose any date between 1 until 31
    Choose Flight Package 1
    Choose Day Package
    Tap Book Order
    Choose Price                            idx_price=1                 #Choos the index price between 1 to 9 
    Tap Confirm Order
    Verify Book Flight Success

3. User Success to Login
    Open Flight App Application
    Tap Sign In
    Input Valid Username
    Input Valid Password
    Tap Submit Username & Password
    Verify Login Success

2. User Failed to Login
    Open Flight App Application
    Tap Sign In
    Input Wrong Username
    Input Valid Password
    Tap Submit Username & Password
    Verify Login Failed Message

5. User Failed to Search Flight
    [Setup]                                 User Success to Login
    Go To Search Page
    Input Wrong Flight Number
    Tap Search
    Verify Search Flight Failed Message

6. User Success to Search Flight
    [Setup]                                 User Success to Login
    Go To Search Page
    Input Valid Flight Number
    Tap Search
    Verify Search Flight Success

1. Application Component should be loaded successfully
    Open Flight App Application    
    Verify App component is shown