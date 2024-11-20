#!/bin/bash

if [ ! -f "input.txt" ]; then
    echo "Файл input.txt не найден!"
    exit 1
fi

echo "Содержимое файла input.txt:"
cat input.txt

wc -l < input.txt > output.txt
echo "Количество строк в input.txt записано в output.txt."

ls nonexistent_file 2> error.log
echo "Ошибки команды ls для несуществующего файла записаны в error.log."
