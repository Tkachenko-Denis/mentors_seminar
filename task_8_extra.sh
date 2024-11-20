#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка: Укажите директорию для резервного копирования."
    echo "Использование: $0 /путь/к/директории"
    exit 1
fi

SOURCE_DIR="$1"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Ошибка: Директория '$SOURCE_DIR' не найдена."
    exit 1
fi

BACKUP_DIR="${SOURCE_DIR}_backup_$(date +%Y%m%d)"
mkdir -p "$BACKUP_DIR"

LOG_FILE="backup_log_$(date +%Y%m%d).log"

FILE_COUNT=0

echo "Начинается резервное копирование..." > "$LOG_FILE"
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        BASENAME=$(basename "$file")
        DEST_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d)_$BASENAME"
        cp "$file" "$DEST_FILE"
        echo "Скопирован файл: $file -> $DEST_FILE" >> "$LOG_FILE"
        ((FILE_COUNT++))
    fi
done

if [ "$FILE_COUNT" -gt 0 ]; then
    echo "Резервное копирование завершено. Скопировано файлов: $FILE_COUNT." >> "$LOG_FILE"
    echo "Резервное копирование успешно завершено. Скопировано файлов: $FILE_COUNT."
    echo "Логи сохранены в файл: $LOG_FILE"
else
    echo "Нет файлов для резервного копирования в '$SOURCE_DIR'." >> "$LOG_FILE"
    echo "Резервное копирование завершено. Нет файлов для копирования."
fi
