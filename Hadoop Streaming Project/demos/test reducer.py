partialREDUCER = [
    "1\t114000,134,5",
    "2\t3500,85,4",
    "3\t30150,260,11",
    "4\t15600,155,6",
    "5\t6000,94,4",
    "6\t43000,261,12",
    "7\t15000,29,1",
    "8\t7350,108,5",
    "8\t5350,108,5"
]

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
        print(f"{league}\t{average_wage},{average_age},{amount_of_players}")

for line in partialREDUCER:
    try:
        league, values = line.strip().split("\t")
        # Usunięcie nawiasów i podział na wage i age

        wage, age, players = values.strip().split(",")  # Usunięcie nawiasów
        league = int(league.strip())
        wage = int(wage.strip())
        age = int(age.strip())
        players = int(players.strip())

    except ValueError:
        continue  # Jeśli linia nie jest poprawnie sformatowana, przechodzimy do kolejnej

    # Jeśli aktualnie przetwarzamy tę samą ligę, co poprzednio
    if current_league == league:
        total_age += age
        total_wage += wage
        total_players += players

    else:
        # Jeśli zmieniła się liga w nowej linijce, wypisujemy wynik poprzedniego rekordu
        if current_league is not None:  # Sprawdzenie, czy jest jakaś poprzednia liga
            output_result(current_league, total_wage, total_age, total_players)

        # Ustawiamy nowy rok i resetujemy zmienne dla nowego roku
        current_league = league
        total_wage = wage
        total_age = age
        total_players = players

        # Po zakończeniu pętli musimy jeszcze wypisać wynik dla ostatniego roku
if current_league is not None:  # Sprawdzenie, czy jest jakaś liga do wypisania
    output_result(current_league, total_wage, total_age, total_players)

