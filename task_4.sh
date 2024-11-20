#!/bin/bash

greet() {
    local name="$1"
    echo "Hello, $name"
}

sum() {
    local num1="$1"
    local num2="$2"
    echo $((num1 + num2))
}

read -p "Введите ваше имя: " username

greet "$username"

read -p "Введите первое число: " number1
read -p "Введите второе число: " number2

result=$(sum "$number1" "$number2")
echo "Сумма чисел $number1 и $number2: $result"
