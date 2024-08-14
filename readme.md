Testovací skripty pro e-shop - Bootcamp 3
Tento projekt obsahuje několik testovacích skriptů pro e-shop na stránce http://tutorialsninja.com/demo/. Skripty jsou napsané v Robot Frameworku a zaměřují se na různé funkčnosti webové aplikace.

Testy:
1. Ověřuje funkčnost vyhledávání
Účel: Velmi jednoduchý text ověřující základní vyhledávání
Postup: Test vyhledá "iPhone" a přesvědčí se, že byl vyhledán
2. 2.Ověřuje porovnávání produktů
Účel: Test ověří, že je možné vygrat si dva náhodné produkty a ty mezi sebou funkcí porovnat
Postup: Test vybere produkt "MacBook" a "iPhone" pro porovnání mezi sebou a zkontroluje, že funkce funguje.
3. Ověřuje přidání a odebrání zboží z wishlistu
Účel: Tento test ověřuje funkčnost přidání a odstranění produktu ze seznamu přání (wishlist).
Postup: Skript přidá produkt "MacBook" do wishlistu, zkontroluje jeho přítomnost a poté produkt odstraní, přičemž ověří, že byl úspěšně odstraněn.
4. Ověří počet produktů v kategorii (Phones & PDAs)
Účel: Tento test ověřuje, že v kategorii "Phones & PDAs" jsou zobrazeny přesně tři produkty.
Postup: Skript naviguje do této kategorie, spočítá počet zobrazených produktů a ověřuje, že se rovná třem.
5. Ověřuje seřazení ceny zboží od nejlevnější po nejdražší
Účel: Tento test ověřuje, že produkty v kategorii "Phones & PDAs" jsou správně seřazeny od nejlevnějšího po nejdražší.
Postup: Skript seřadí produkty podle ceny vzestupně, poté získá ceny prvních tří produktů a ověří, že jsou správně seřazeny.