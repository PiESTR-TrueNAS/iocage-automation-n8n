#!/bin/sh

DATE=$(date "+%Y%m%d%H%M%S")
DATABASE_DIR="/root/.n8n"
BACKUP_DIR="/mnt/N8N/backup"

cp ${DIR}/database.sqlite ${BACKUP_DIR}/database.${DATE}.sqlite
