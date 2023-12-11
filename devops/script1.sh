#!/bin/bash

# Перевірка кількості переданих аргументів
if [ "$#" -ne 2 ]; then
    echo "Використання: $0 <шлях_до_директорії> <розширення>"
    exit 1
fi

# Зчитування аргументів
directory_path="$1"
file_extension="$2"

# Пошук файлів та виведення результату
found_files=$(find "$directory_path" -type f -name "*.$file_extension")

if [ -n "$found_files" ]; then
    echo "Знайдено файли з розширенням .$file_extension у директорії $directory_path:"
    echo "$found_files"
else
    echo "Файлів з розширенням .$file_extension у директорії $directory_path не знайдено."
fi