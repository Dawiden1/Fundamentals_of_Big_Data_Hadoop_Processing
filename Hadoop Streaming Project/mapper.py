#!/usr/bin/env python3

import sys  # Umożliwia pracę z wejściem i wyjściem wiersza poleceń (stdin, stdout)

# kolumna z ligą
LEAGUE_ID = 16

# kolumny z zarobkami i wiekiem
WAGE_EUR = 11
AGE = 12

# kolumna z wagą zawodnika
WEIGHT_KG = 15

for line in sys.stdin:
    # Usuwamy białe znaki na początku i końcu oraz dzielimy linię na kolumny na podstawie srednikow:
    values = line.strip().split(";")
    if len(values) > max(LEAGUE_ID, WAGE_EUR, AGE, WEIGHT_KG):
        if int(values[WEIGHT_KG]) < 100:
            wage = values[WAGE_EUR]
            age = values[AGE]
            league = values[LEAGUE_ID]
            print(f"{league.strip()}\t{wage.strip()}\t{age.strip()}")