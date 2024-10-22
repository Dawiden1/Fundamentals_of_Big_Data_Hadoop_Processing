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

league_sums = {}

for line in partialREDUCER:
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
