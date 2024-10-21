partialREDUCER = [
    "1\t20000,27",
    "1\t28000,32",
    "1\t59000,31",
    "1\t2000,18",
    "1\t5000,26",
    "2\t500,20",
    "2\t500,21",
    "2\t500,21",
    "2\t2000,23",
    "3\t4000,26",
    "3\t500,22",
    "3\t650,21",
    "3\t2000,20",
    "3\t2000,22",
    "3\t2000,21",
    "3\t2000,21",
    "3\t2000,27",
    "3\t3000,22",
    "3\t3000,31",
    "3\t9000,27",
    "4\t650,18",
    "4\t1000,32",
    "4\t2000,30",
    "4\t1000,24",
    "4\t950,26",
    "4\t10000,25",
    "5\t2000,35",
    "5\t2000,21",
    "5\t1000,19",
    "5\t1000,19",
    "6\t15000,27",
    "6\t2000,25",
    "6\t3000,28",
    "6\t4000,19",
    "6\t500,17",
    "6\t3000,26",
    "6\t500,19",
    "6\t3000,23",
    "6\t3000,18",
    "6\t6000,20",
    "6\t2000,19",
    "6\t1000,20",
    "7\t15000,29",
    "8\t1000,25",
    "8\t2000,18",
    "8\t850,21",
    "8\t3000,25",
    "8\t500,19"
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

