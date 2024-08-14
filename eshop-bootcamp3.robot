*** Settings ***
Documentation       Tahle sada testů ověřuje webshop pro Bootcamp 3
Library             SeleniumLibrary

#Příkaz pro spuštění scriptu:
#robot -d results tests/eshop-bootcamp3.robot

*** Variables ***

${URL}    http://tutorialsninja.com/demo/
${SEARCH_TERM}    iPhone
${PRODUCT_1}    MacBook
${PRODUCT_2}    iPhone
${EXPECTED_PRODUCT_COUNT}    3

*** Test Cases ***
1.Ověřuje funkčnost vyhledávání
    Open Browser    ${URL}    Edge
    Maximize Browser Window

    # Vyhledává zboží
    Input Text    name=search    ${SEARCH_TERM}
    Click Button    xpath=//button[@class='btn btn-default btn-lg']

    # Ověří, že vyhledávání obsahuje zboží
    Page Should Contain    ${SEARCH_TERM}

    Close Browser

2.Ověřuje porovnávání produktů
    Open Browser    ${URL}    Edge
    Maximize Browser Window

    # Přidá první produkt do porovnání
    Click Link    ${PRODUCT_1}
    Click Button    xpath=//button[@data-original-title='Compare this Product']
    Sleep    1s
    Go Back

    # Přidá druhý produkt do porovnání
    Input Text    name=search    ${PRODUCT_2}
    Click Button    xpath=//button[@class='btn btn-default btn-lg']
    Click Button    xpath=//button[@data-original-title='Compare this Product']
    Sleep    1s

    # Přejde na stránku porovnání produktů
    Click Link    xpath=//a[contains(@href, 'compare')]

    # Ověří, že oba produkty jsou na stránce porovnání
    Page Should Contain    ${PRODUCT_1}
    Page Should Contain    ${PRODUCT_2}

    Close Browser

3. Ověřuje přidání a odebrání zboží z wishlistu
    Open Browser    ${URL}    Edge
    Maximize Browser Window

    # přihlásí se pomocí XPath
    Click Element    xpath=//span[text()='My Account']
    Click Element    xpath=//a[text()='Login']

    # Vyplní přihlašovací údaje
    Input Text    name=email    habufado.urecele@jollyfree.com
    Input Text    name=password    Prdka27

    # Odešle přihlašovací formuláře
    Click Button    xpath=//input[@value='Login']

    # Vrátí se na úvodní stránku kliknutím na logo firmy
    Click Element    xpath=//a[text()='Qafox.com']

    # Přidá produkt do wishlistu
    Click Link    ${PRODUCT_1}
    Click Button    xpath=//button[@data-original-title='Add to Wish List']
    Sleep    1s

    # Přejde na stránku wishlistu
    Click Link    xpath=//a[contains(@href, 'wishlist')]
    Sleep    1s

    # Ověří si, že produkt je v wishlistu
    Page Should Contain    ${PRODUCT_1}

    # Odstraní produktu z wishlistu
    Click Button   xpath=//a[@title='Remove']
    Sleep    1s

    # Ověří, že produkt byl odstraněn z wishlistu
    Page Should Not Contain    ${PRODUCT_1}

    Close Browser

4. Ověří počet produktů v kategorii
    Open Browser    ${URL}    Edge
    Maximize Browser Window

    # Přejde do kategorie "Phones & PDAs"
    Click Link    xpath=//a[text()='Phones & PDAs']

    # Ověří, že počet produktů v kategorii je správný
    ${product_count}    Get Element Count    xpath=//div[contains(@class, 'product-layout')]
    Should Be Equal As Numbers    ${product_count}    ${EXPECTED_PRODUCT_COUNT}

    Close Browser

5. Ověřuje seřazení ceny zboží od nejlevnější po nejdražší
    Open Browser    ${URL}    Edge
    Maximize Browser Window

    # Přejde do kategorie "Phones & PDAs"
    Click Link    xpath=//a[text()='Phones & PDAs']

    # Seřadí produkty od nejlevnějšího po nejdražší
    Select From List By Label    xpath=//select[@id='input-sort']    Price (Low > High)
    Sleep    2s

    # Ověří správnost řazení pomocí textového porovnání
    ${first_price_text}    Get Text    xpath=(//p[@class='price'])[1]
    ${second_price_text}    Get Text    xpath=(//p[@class='price'])[2]
    ${third_price_text}    Get Text    xpath=(//p[@class='price'])[3]

    # Extrahuje číselné části z textu ceny
    ${first_price}    Evaluate    float('${first_price_text.split()[0][1:].replace(",", "")}')
    ${second_price}    Evaluate    float('${second_price_text.split()[0][1:].replace(",", "")}')
    ${third_price}    Evaluate    float('${third_price_text.split()[0][1:].replace(",", "")}')

    # Ověří, že ceny jsou správně seřazeny
    Should Be True    ${first_price} <= ${second_price} <= ${third_price}

    Close Browser

*** Keywords ***
