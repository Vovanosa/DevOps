#!/bin/bash

logfile="./my-app.log"

# Отримати інформацію про поточний розмір та дату зміни файлу
current_size=$(stat -c %s "$logfile")
current_date=$(stat -c %Y "$logfile")

# Шлях до файлу, в якому зберігатиметься інформація про розмір та дату зміни файлу
info_file="./logfile_info.txt"

# Перевірити, чи файл змінився
if [ -f "$info_file" ]; then
    read -r prev_size prev_date < "$info_file"
else
    prev_size=0
    prev_date=0
fi

if [ "$current_size $current_date" != "$prev_size $prev_date" ]; then
    # Вивести інформацію про зміни на екран
    echo "Файл $logfile був змінений:"
    echo "Попередній розмір: $prev_size, Попередня дата: $prev_date"
    echo "Поточний розмір: $current_size, Поточна дата: $current_date"

    # Оновити інформацію в файлі
    echo "$current_size $current_date" > "$info_file"
else
    echo "Файл $logfile не змінився."
fi