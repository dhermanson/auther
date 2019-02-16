#! /bin/bash

set -e

OLD_IFS=$IFS
IFS=';' read -ra NAMES <<< "$USERNAMES"

for USERNAME_PASSWORD_STR in "${NAMES[@]}"; do
  IFS=':' read -r -a VALUES <<< "$USERNAME_PASSWORD_STR"
  htpasswd -b /etc/apache2/.htpasswd ${VALUES[0]} ${VALUES[1]}
done

IFS=$OLD_IFS

unset OLD_IFS
unset NAMES
unset USERNAME_PASSWORD_STR
unset USERNAMES
unset VALUES

exec "$@"
