#!/bin/bash

check_memory_usage() {
    total_memory=$(free -m | awk '/^Mem:/{print $2}')
    used_memory=$(free -m | awk '/^Mem:/{print $3}')
    memory_percentage=$((used_memory * 100 / total_memory))

    echo "Использование памяти: $memory_percentage%"

    if [ "$memory_percentage" -gt 80 ]; then
        echo "Внимание! Использование памяти превышает 80%."
        echo "Текущие процессы, потребляющие наибольшее количество ресурсов:"
        ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 10
    fi
}

check_cpu_load() {
    cpu_load=$(uptime | awk -F'load average:' '{print $2}' | cut -d',' -f1 | xargs)
    echo "Средняя загрузка процессора за 1 минуту: $cpu_load"
}

check_disk_usage() {
    echo "Использование дискового пространства:"
    df -h | grep '^/dev/'
}

echo "Мониторинг ресурсов системы:"
echo "---------------------------"
check_memory_usage
echo
check_cpu_load
echo
check_disk_usage
