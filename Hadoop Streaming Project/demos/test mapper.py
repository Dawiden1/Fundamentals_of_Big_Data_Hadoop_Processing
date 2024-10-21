# kolumna z ligą
LEAGUE_ID = 16

# kolumny z zarobkami i wiekiem
WAGE_EUR = 11
AGE = 12

# kolumna z wagą zawodniak
WEIGHT_KG = 15
SUM_OVERWEIGHT = 0

with open('partialMAPPER2.csv', 'r', encoding='utf-8') as file:
    #next(file)
    for line in file:
        # Usuwamy białe znaki na początku i końcu oraz dzielimy linię na kolumny na podstawie przecinków
        values = line.strip().split(";")
        if len(values) > max(LEAGUE_ID, WAGE_EUR, AGE, WEIGHT_KG):
            if int(values[WEIGHT_KG]) < 100:
                wage = values[WAGE_EUR]
                age = values[AGE]
                league = values[LEAGUE_ID]

                if '' in (league, wage, age):
                    continue
                print(f"{league.strip()}\t{wage.strip()},{age.strip()}")
            else: SUM_OVERWEIGHT += 1


print(f"Ilosc pilkarzy z waga minimum 100kg wynosila: {SUM_OVERWEIGHT}")