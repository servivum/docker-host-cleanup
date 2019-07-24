#!/bin/sh
set -e

# Mask slashes for sed command in cron syntax
export CRON_INTERVAL=$(echo "$CRON_INTERVAL" | sed 's/\//\\\//g')

echo "Render crontab…"
sed "s/{{CRON_INTERVAL}}/$CRON_INTERVAL/g" /etc/cron/crontab-template > /etc/cron/crontab

echo "Initializing cronjob…"
crontab /etc/cron/crontab

echo "Running crond…"
exec "$@"