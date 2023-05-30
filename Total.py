import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# URL адрес к данным о смертях
url_death = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv'

# Загрузка данных с помощью pandas
df_death = pd.read_csv(url_death)

# Удаление столбцов с ненужной информацией
df_death = df_death.drop(labels=["Lat","Long", "Province/State"], inplace=False, axis=1)

# Создание списка с общем количеством смертей по странам
result = []
for q in df_death.iloc:
  result.append((q[0], q[-1]))

# Сортировка стран по количеству смертей
result.sort(key = lambda x: x[1])

# Суммирование смертей в остальных страннах (кроме 15 с самыми высокими значениями)
other = sum(i[1] for i in result[:-15])

# Помещаем 15 стран с самыми высокими значениями смертей в начало
result = result[-15:]

# Добавляем остальные
result.insert(0, ("Other", other))


plt.figure(figsize=(12, 6))  # Установка размера графика
plt.barh([i[0] for i in result], [i[1] for i in result])
plt.xlabel('Number of Deaths')
plt.title('COVID-19 Deaths')
plt.grid(False)
plt.show()