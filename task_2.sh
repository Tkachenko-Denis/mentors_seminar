#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка: Укажите директорию для добавления в PATH."
    exit 1
fi

new_dir="$1"

if [ ! -d "$new_dir" ]; then
    echo "Ошибка: Указанная директория '$new_dir' не существует."
    exit 1
fi

echo "Текущее значение PATH:"
echo "$PATH"

export PATH="$PATH:$new_dir"

echo "Обновленное значение PATH:"
echo "$PATH"
