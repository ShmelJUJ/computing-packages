import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
# Импорт из titanic.csv
data = pd.read_csv(r'titanic.csv')

class_names = {1: 'Elite', 2: 'Middle', 3: 'Worker'}

# Добавление ценовой категории
data['Price_Category'] = data['Fare'].apply(lambda x: 'cheap' if x < 25 else 'expensive')
print(data)


new_data = data[['Name', 'Pclass']].copy()
new_data['Class'] = new_data['Pclass'].map(class_names)
new_data = new_data.sort_values('Pclass')
print(new_data)

class_counts = new_data['Class'].value_counts()

# Подсчёт выживших по полу
woman = len(data[(data['Sex'] =='female') & (data['Survived']== 1)])
man = len(data[(data['Sex'] =='male') & (data['Survived']== 1)])

# Подсчёт погибших по полу
woman_dead = len(data[(data['Sex'] =='female') & (data['Survived']== 0)])
man_dead = len(data[(data['Sex'] =='male') & (data['Survived']== 0)])

# Построение круговых диаграмм
plt.subplot(2, 3, 1)
plt.title('Class  ')
plt.pie(class_counts, labels=class_counts.index, autopct='%1.1f%%', startangle=90)
plt.subplot(2, 3, 2)
plt.title('Survived   ')
plt.pie([woman, man], labels=['Male', 'Female'], autopct='%1.1f%%', startangle=90)
plt.subplot(2, 3, 3)
plt.title('Died')
plt.pie([woman_dead, man_dead], labels=['Male', 'Female'], autopct='%1.1f%%', startangle=90)
plt.show()

# Подсчёт общего кол-ва людей, выживших, погибших
total = len(data)
survived = data['Survived'].sum()
died = total - survived
print("Total: ",total, "\nSurvived: ", survived, "\nDied: ", died, "\n")


# Удаление столбцов с пропущенными значениями
age_data = data['Age'].dropna()

survived_age_data = data[data['Survived'] == 1]['Age'].dropna()
dead_age_data = data[data['Survived'] == 0]['Age'].dropna()

# Построение гистограммы
plt.figure(figsize=(80,70))
plt.hist(survived_age_data, bins=20, edgecolor='white', label='Survived')
plt.hist(dead_age_data, bins=20, edgecolor='white', label='Dead')
plt.xlabel('Age')
plt.ylabel('Frequency')
plt.title('Distribution of Age')
plt.show()