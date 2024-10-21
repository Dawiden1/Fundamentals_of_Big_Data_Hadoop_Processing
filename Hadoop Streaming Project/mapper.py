#!/usr/bin/env python3

import sys  # Umożliwia pracę z wejściem i wyjściem wiersza poleceń (stdin, stdout)
import re   # Moduł do pracy z wyrażeniami regularnymi

# Wyrażenie regularne do wyodrębnienia roku z daty w formacie "DD/MM/YYYY"
p = re.compile(r'"\d+\/\d+\/(\d+)"')

# kolumna z ligą
LEAGUE_ID = 16

# kolumny z zarobkami i wiekiem
WAGE_EUR = 11
AGE = 12

# kolumna z wagą zawodniak
WEIGHT_KG = 15
#SUM_OVERWEIGHT = 0

for line in sys.stdin:
    # Usuwamy białe znaki na początku i końcu oraz dzielimy linię na kolumny na podstawie przecinków
    values = line.strip().split(";")
    if len(values) > max(LEAGUE_ID, WAGE_EUR, AGE, WEIGHT_KG):
        if int(values[WEIGHT_KG]) < 100:
            wage = values[WAGE_EUR]
            age = values[AGE]
            league = values[LEAGUE_ID]
            print(f"{league.strip()}\t{wage.strip()}\t{age.strip()}")
        #else: SUM_OVERWEIGHT += 1

#print(f"Ilosc pilkarzy z waga minimum 100kg wynosila: {SUM_OVERWEIGHT}")