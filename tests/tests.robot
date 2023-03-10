*** Settings ***
Resource                        ../resources/common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite
Library                         DateTime

*** Test Cases ***
Loop Testing
    GoTo                        https://qentinelqi.github.io/shop/
    @{animals}                  Create List                 Sacha the Deer              Bumble the Elephant         Gerald the Giraffe
    FOR                         ${item}                     IN                          @{animals}
        ClickText               ${item}
        VerifyText              Slim Fit, 5oz 100% Cotton T-Shirt.
        ClickText               Add to cart
        VerifyText              Shipping and taxes will be calculated at checkout.
        ClickText               Products
        VerifyText              Find your spirit animal
    END



Loop Over a List with Nested If Statement
    @{users}                    Create List                 Guest                       Sales                       Admin
    FOR                         ${user}                     IN                          @{users}
        Log                     This is a success message.
        IF                      '${user}' == 'Admin'
            Log                 The current user is an Admin
        ELSE IF                 '${user}' == 'Guest'
            Log                 The current user is an Guest
        ELSE
            Log                 The current user is someone else
        END
    END

AnotherTest
    [Documentation]
    [Tags]
    @{OD_Data}    Create List    Operational Data    More
    FOR   ${data}     IN     in    @{OD_Data}
        ${data}       IsText       More
         Log                     'wat is de data'${data}
        IF                      '${data}' == 'Admin'
            Log                 The current user is an Admin
        ELSE IF                 '${data}' == 'Guest'
            Log                 The current user is an Guest
        ELSE
            Log                 The current user is someone else
        END
    END



IF Statement
    ${number}=                  Set Variable                10
    IF                          ${number} >= 10
        Log to Console          True
    ELSE IF                     ${number} > 10
        Log to Console          True
    ELSE IF                     ${number} == 10
        Log to Console          True
    ELSE IF                     ${number} != 10
        Log to Console          False
    ELSE IF                     ${number} < 10
        Log to Console          False
    END

    ${second_number}            Set Variable                10
    Should Be Equal             ${number}                   ${second_number}

Run Keyword If 
    ${foo}                      Set Variable                test value
    Log To Console              ${foo}
    Run Keyword If              '${foo}'=='test value'      Example Keyword

    Set Library Search Order    QWeb

Mathematical Expressions

    ${discount_percentage}=     Set Variable                .2
    ${list_price}=              Set Variable                100000
    ${total_cost}=              Set Variable                5000
    ${currency}=                Set Variable                USD

    #Calculate Net Price at 20% discount of List Price
    ${net_price}=               Evaluate                    int(${list_price}-(${list_price}*${discount_percentage}))
    Should Be Equal As Integers                             ${net_price}                80000

    ${net_price_formatted}=     Format String               {:,}                        ${net_price}
    Should Be Equal             ${currency} ${net_price_formatted}                      USD 80,000

    #Calculate net margin %; verify accuracy of CPQ field
    ${net_margin}=              Evaluate                    ((${net_price}-${total_cost})/${list_price})*100
    Should Be Equal As Numbers                              ${net_margin}               75

Working with Date Formats
    ${now}=                     Get Current Date

    ${timestamp}=               Convert Date                ${now}                      result_format=%b %d, %Y
    ${timestamp}=               Convert Date                ${now}                      result_format=%d %b %Y %I:%M %p


*** Keywords *** ***
Example Keyword
    Log To Console              The example keyword ran succesfully

Close All Salesforce Tabs
    HotKey                      shift                       w
    ${multiple_tabs}=           IsText                      Close all tabs?             5s
    IF                          ${multiple_tabs}
        ClickText               Close All
    END

    ${date}                     Get Current Date


Loop Testing
    GoTo                        https://qentinelqi.github.io/shop/
    FOR                         ${item}                     IN                          @{users}
        VerifyNoText            ${item}
    END


    