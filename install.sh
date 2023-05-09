#!/bin/bash
# This is a comment

sudo apt update
sudo apt upgrade -y
sudo apt install dante-server libpam-pwdfile -y

systemctl stop danted.service

echo "# Путь к лог файлу
logoutput: /var/log/socks.log
# Можно задать отдельный лог файл для ошибок
# errorlog: /var/log/socks_error.log

internal: eth0 port = 1080 #eth0 -- ваш внешний сетевой интерфейс
external: eth0 #eth0 -- ваш внешний сетевой интерфейс

##Тип авторизации
#Работа без пароля
#socksmethod: none
#Авторизация по локальным/системным пользователям (наш случай)
#socksmethod: username
#Авторизация при помощи логина/пароля, сохраняемого в PAM-файле:
socksmethod: pam.username


# Мы используем системных пользователей, поэтому нужны права на чтение passwd
user.privileged: root
user.unprivileged: nobody
user.libwrap: nobody

# Разрешить подключения с любых IP всем пользователям прошедшим авторизацию
client pass {
        from: 0/0 to: 0/0
        log: connect disconnect error ioop
}

socks pass {
        from: 0/0 to: 0/0
        log: connect disconnect error ioop
}" > /etc/danted.conf

echo "auth required pam_pwdfile.so pwdfile /etc/dante.passwd
account required pam_permit.so" > /etc/pam.d/sockd

echo "">/etc/dante.passwd



systemctl start danted.service
