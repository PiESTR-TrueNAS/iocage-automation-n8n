#!/bin/sh
	
# This script gets executed inside the jail right after plugin installation
# This is executed BEFORE any jailman scripts

# ===== Install packages
npm install -f n8n

# ===== Start n8n on boot
bin=$(which n8n)
daemon=$(which daemon)
dir="/mnt/n8n"
cronf="${dir}/cron"
date=$(date "+%Y%m%d%H%M%S")
pidfile="/var/run/n8n.pid"

touch ${cronf}
echo "0 * * * * cp /root/.n8n/database.sqlite ${dir}/backup/database.${date}.sqlite" >> ${cronf}
echo "@reboot   N8N_CONFIG_FILES=${dir}/config.json ${daemon} -f -p ${pidfile} ${bin}" >> ${cronf}
crontab -u root ${cronf}
