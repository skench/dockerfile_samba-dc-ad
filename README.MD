Dockerfile для настройки DC.

Запускать с параметрами 

docker build -t samba .

docker run --name samba -it samba bash

В файл /etc/hosts  необходимо добавить для примера ниже строка.

172.18.0.4      3b96ee60eb73.arm-24.net         3b96ee60eb73

после запускаем скрипт ./samba-tools.sh

и проверяем
kinit administrator   - ту запрашивается пароль, пароль указан в скрипте samba-tools.sh, его можно изменить под себя.


2 оставшихся скрипта пока не используются. Нужно настроить автоматически, чтобы в файл /etc/krb5.conf в строке
kdc =  и   admin_server =   автоматически дописывалось имя hostname перед атрибутами .arm-24.net