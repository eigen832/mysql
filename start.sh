#!/bin/bash

if [ ! -d /var/lib/mysql/mysql ]; then
    # Выставляем правильные права доступа
    chown mysql:mysql /var/lib/mysql

    # Инициализируем системные таблицы
    mysql_install_db
fi
# mysqld_safe --bind-address=0.0.0.0

# Вешаем остановку MySQL на сигнал TERM
trap "mysqladmin shutdown" TERM

# Запускаем MySQL в фоне
mysqld_safe --bind-address=0.0.0.0 &

# Ждём завершения всех порождённых процессов
wait
