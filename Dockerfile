FROM docker:19.03
LABEL maintainer "Patrick Baber <patrick.baber@servivum.com>"

COPY etc/cron/crontab-template /etc/cron/crontab-template
COPY usr/local/bin/ /usr/local/bin/

CMD ["crond", "-f"]
ENTRYPOINT ["docker-entrypoint.sh"]