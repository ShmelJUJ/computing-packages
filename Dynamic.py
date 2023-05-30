import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# URL адрес к данным о новых случая
url_confirmed = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"

# Загрузка данных с помощью pandas
df_cases = pd.read_csv(url_confirmed)

# Агрегирование данных по странам
data_by_country = df_cases.groupby('Country/Region').sum()

# Выбор страны для анализа
country = str(input("Enter country: "))

date_check = str.lower(input('Show statistics for all time? (y/n): ')) #Отображение статистики за всё время или промежуток?

if (date_check == "n"):
   date1 = str(input("Enter first date (MM/DD/YY): ")) #Ввод начальной даты промежутка
   date2 = str(input("Enter second date (MM/DD/YY): ")) #Ввод конечной даты промежутка
else:
  date1="1/22/20"
  date2=df_cases.columns[-1]

d1 = (df_cases.columns.tolist()).index(date1)
d2 = (df_cases.columns.tolist()).index(date2)
cases_absolute = []
i = 0
#Подсчёт динамики случаев в абсолютных значениях
while d1<d2:
    if d1 == 4:
        cases_absolute.append(data_by_country.loc[country].values[d1])
    else:
        cases_absolute.append(data_by_country.loc[country].values[d1]-data_by_country.loc[country].values[d1-1])
    d1 +=1
    i += 1

dates = pd.to_datetime(df_cases.columns[(df_cases.columns.tolist()).index(date1):(df_cases.columns.tolist()).index(date2)], format='%m/%d/%y')
# Построение графика случаев в абсолютных значениях
plt.figure(figsize=(12, 6))  # Установка размера графика
plt.plot(dates, cases_absolute, label='Cases')
plt.xlabel('Date')
plt.ylabel('Number of Cases')
plt.title(f'COVID-19 Cases in {country}')
plt.xticks(rotation=45)  # Поворот меток оси x для удобства чтения
plt.grid(True)
plt.legend()
plt.show()

total_cases = data_by_country.loc[country].values[-1]
cases_percentage = []
c = 0
#Подсчёт динамики в процентных значениях
while c<=len(cases_absolute)-1:
    if cases_absolute[c] == 0:
        cases_percentage.append(0)
    else:
        cases_percentage.append(cases_absolute[c] / total_cases * 100)
    c +=1
#Построение графика случаев в процентных значениях
plt.figure(figsize=(12, 6))  # Установка размера графика
plt.plot(dates, cases_percentage, label='Cases')
plt.xlabel('Date')
plt.ylabel('Percentage ratio of cases')
plt.title(f'COVID-19 Cases in {country}')
plt.xticks(rotation=45)  # Поворот меток оси x для удобства чтения
plt.grid(True)
plt.legend()
plt.show()