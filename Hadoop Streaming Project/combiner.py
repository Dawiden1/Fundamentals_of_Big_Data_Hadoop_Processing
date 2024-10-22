#!/usr/bin/env python3

import sys

league_sums = {}

for line in sys.stdin:
    try:
        league, values = line.strip().split("\t")
        wage, age = values.strip().split(",")
        league = int(league.strip())
        wage = int(wage.strip())
        age = int(age.strip())
    except ValueError:
        continue  # Jeśli linia nie jest poprawnie sformatowana, pomiń

    # Sumowanie wartości dla tej ligi
    if league not in league_sums:
        league_sums[league] = [0, 0, 0]  # [total_wage, total_age, total_players]

    # Aktualizacja sum dla danej ligi
    league_sums[league][0] += wage
    league_sums[league][1] += age
    league_sums[league][2] += 1

# Wypisujemy częściowe sumy dla każdej ligi
for league, sums in league_sums.items():
    total_wage, total_age, total_players = sums
    print(f"{league}\t{total_wage},{total_age},{total_players}")
