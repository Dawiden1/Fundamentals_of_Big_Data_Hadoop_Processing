#!/usr/bin/env python3

import sys  # Umożliwia pracę z wejściem i wyjściem wiersza poleceń (stdin, stdout)

current_league = None
total_weight = 0
total_age = 0
total_wage = 0
total_players = 0

def output_result(league, sum_wage, sum_age, amount_of_players):
    """ Wypisuje średnią wartość zarobków i wieku w danej lidze """
    if amount_of_players > 0:  # Sprawdzamy, czy mamy co najmniej jeden wpis dla danej ligi
        average_wage = int(sum_wage / amount_of_players)
        average_age = int(sum_age / amount_of_players)
        print(f"{league}\t{average_wage},{average_age}")

# Odczyt linii wejściowych (dostarczanych z Mappera)
for line in sys.stdin:
    try:
        league, values = line.strip().split("\t")
        # Usunięcie nawiasów i podział na wage i age

        wage, age = values.strip().split(",")  # Usunięcie nawiasów
        league = int(league.strip())
        wage = int(wage.strip())
        age = int(age.strip())

    except ValueError:
        continue  # Jeśli linia nie jest poprawnie sformatowana, przechodzimy do kolejnej

    # Jeśli aktualnie przetwarzamy tę samą ligę, co poprzednio
    if current_league == league:
        total_age += age
        total_wage += wage
        total_players += 1

    else:
        # Jeśli zmieniła się liga w nowej linijce, wypisujemy wynik poprzedniego rekordu
        if current_league is not None:  # Sprawdzenie, czy jest jakaś poprzednia liga
            output_result(current_league, total_wage, total_age, total_players)

        # Ustawiamy nowy rok i resetujemy zmienne dla nowego roku
        current_league = league
        total_wage = wage
        total_age = age
        total_players = 1

    # Po zakończeniu pętli musimy jeszcze wypisać wynik dla ostatniego roku
if current_league is not None:  # Sprawdzenie, czy jest jakaś liga do wypisania
    output_result(current_league, total_wage, total_age, total_players)
