#!/bin/bash

# 1. Создаём список всех файлов в текущей директории с указанием их типа
echo "Список файлов и их типов:"
for entry in *; do
    if [ -d "$entry" ]; then
        echo "$entry: каталог"
    elif [ -f "$entry" ]; then
        echo "$entry: файл"
    elif [ -L "$entry" ]; then
        echo "$entry: символическая ссылка"
    else
        echo "$entry: другой тип"
    fi
done

# 2. Проверяем наличие файла, переданного как аргумент
if [ -z "$1" ]; then
    echo "Ошибка: укажите имя файла в качестве аргумента."
    exit 1
fi

if [ -e "$1" ]; then
    echo "Файл '$1' найден."
else
    echo "Файл '$1' отсутствует."
fi

# 3. Используем цикл for для вывода имени и прав доступа каждого файла
echo "Информация о файлах в текущей директории:"
for entry in *; do
    permissions=$(ls -ld "$entry" | awk '{print $1}')
    echo "Имя: $entry, Права доступа: $permissions"
done
