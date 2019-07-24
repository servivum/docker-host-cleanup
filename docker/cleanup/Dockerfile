FROM docker:18.09
LABEL maintainer "Patrick Baber <patrick.baber@servivum.com>"

COPY docker/cleanup/etc/cron/crontab-template /etc/cron/crontab-template
COPY docker/cleanup/usr/local/bin/ /usr/local/bin/

CMD ["crond", "-f"]
ENTRYPOINT ["docker-entrypoint.sh"]