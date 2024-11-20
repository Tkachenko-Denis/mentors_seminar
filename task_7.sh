#!/bin/bash

if alias ll &>/dev/null; then
    echo "Alias 'll' уже настроен."
else
    echo "Временный alias 'll' создаётся..."
    alias ll="ls -la"
fi

if grep -q "alias ll=" ~/.bashrc; then
    echo "Alias 'll' уже добавлен в ~/.bashrc."
else
    echo "Добавление alias 'll' в ~/.bashrc..."
    echo "alias ll='ls -la'" >> ~/.bashrc
    echo "Alias 'll' успешно добавлен."
fi

echo "Применение изменений из ~/.bashrc..."
source ~/.bashrc
