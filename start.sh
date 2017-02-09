#!/bin/bash

if [ ! -d /var/lib/mysql/mysql ]; then
    # Выставляем правильные права доступа
    chown mysql:mysql /var/lib/mysql

    # Инициализируем системные таблицы
    mysql_install_db
fi

# mysqld_safe --bind-address=0.0.0.0

trap "mysqladmin shutdown" TERM
mysqld_safe --bind-address=0.0.0.0 &
wait
