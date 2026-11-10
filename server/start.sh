#!/bin/sh
set -eu

# Comprobar las variables necesarias
: "${FTP_USER_NAME:?Falta FTP_USER_NAME}"
: "${FTP_USER_PASS:?Falta FTP_USER_PASS}"
: "${FTP_USER_HOME:?Falta FTP_USER_HOME}"
: "${PUBLICHOST:?Falta PUBLICHOST}"

# Crear el directorio del usuario FTP
mkdir -p "$FTP_USER_HOME"
chown -R ftpuser:ftpgroup "$FTP_USER_HOME"

# Crear la cuenta virtual de Pure-FTPd
printf '%s\n%s\n' "$FTP_USER_PASS" "$FTP_USER_PASS" |
    pure-pw useradd "$FTP_USER_NAME" \
        -f /etc/pure-ftpd/pureftpd.passwd \
        -F /etc/pure-ftpd/pureftpd.pdb \
        -u ftpuser \
        -g ftpgroup \
        -d "$FTP_USER_HOME" \
        -m

echo "Usuario FTP configurado."
echo "Iniciando Pure-FTPd en ${PUBLICHOST}"

exec /usr/local/sbin/pure-ftpd \
    -l puredb:/etc/pure-ftpd/pureftpd.pdb \
    -E -j -R \
    -P "$PUBLICHOST" \
    -p 30000:30009 \
    -c 5 \
    -C 5
