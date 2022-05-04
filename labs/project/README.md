# Morse code transmitter, ie converter of characters/numbers to Morse code.

### Team members

* Erik Fatkhutdinov (responsible for 214968)
* Michal Kubant (responsible for 230608)

Link to your GitHub project folder:

   https://github.com/fatkh0/digital-electronics-1/tree/main/labs/project/project


### Table of contents
* [Project objectives](#objectives)
* [Hardware description](#hardware)
* [VHDL modules description and simulations](#modules)
* [TOP module description and simulations](#top)
* [Video](#video)
* [References](#references)


<a name="objectives"></a>
## Project objectives

Námi vytvořený vysílač morseova kódu by měl pomocí LED integrované na řídicí desce indikovat délku vysílaného signálu, a nahrazovat tak výstup klasického vysílače. 
Vstupní symboly morseovy abecedy jsou definovány dvojicí hexadecimálních čísel (pro základní abecedu v ASCII kódu jsou dva znaky dostačující), které uživatel navolí pomocí dvou čtveřic mechanických přepínačů (SW[0 - 8]), které jsou taktéž integrovány na řídicí desce. Pro snadnější uživatelský přístup jsou vždy právě zvolená hexadecimální čísla zobrazena na sedmisegmentových displejích, které deska Nexys obsahuje.
Po nastavení přepínačů by měl uživatel stisknout tlačítko na řídicí desce (BTNC), kód zpracuje vstupní bity, a vyšle požadovaný symbol v morseově kódu na výstup.
Morseova abeceda je vysílaný sousled teček a pomlček. V tomto projektu je impuls na výstupu buď:
- tečka: zobrazována tak, že LED svítí sekundu červeně
- pomlčka: LED svítí 3 sekundy červeně
- prázdná linka: LED nesvítí (mezi znaky 1 sekubdu, a po každém symbolu 3 s)

K realizaci jsme využívali pouze znalosti a námi vytvořené projekty z průběhu cvičení. Nepodařilo se nám ale správně propojit soubory tak, aby program správně pracoval. Projekt tedy demonstruje pouze funkčnost načítání vstupů, realizaci výstupů, a teoretickou funkci TOP modulu.


<a name="hardware"></a>
## Hardware description

Projekt využívá pouze desku Nexys A7-50T, a její integrované vstupní a výstupní komponenty.
K načítání vstupů je použito 8 mechanických přepínačů (SW[0 - 8]).
K zobrazování vstupních hodnot dva sedmisegmentové displeje.
K potvrzování dat prostřední tlačítko (BTNC).
A pro zovrazování výstupních signálů RGB LED (LED16_R).


<a name="modules"></a>
## VHDL modules description and simulations

- hex_7seg.vhd – převod čtyř vstupních bitů na sedm výstupních bitů tak, aby zobrazovali hexadecimální znak podle hodnoty na vstupu
- driver_7seg_4digits.vhd – přepínání sedmisegmentových displejů tak, aby bylo v reálném čase možné vidět svítit vice sedmisegmentových displejů najednou.
- clock_enable.vhd – řízení generátoru hodinového signálu, který využívají téměř všechny moduly projektu.
- tlc.vhd – modul určený k rozpoznávání vstupního znaku, a jeho následnému zpracování pomocí 
case logiky tak, aby na výstupu svítila vždy správná kombinace symbolických teček, čárek a mezer.


<a name="top"></a>
## TOP module description and simulations

Write your text here.


<a name="video"></a>
## Video

Write your text here


<a name="references"></a>
## References

1. Write your text here.
