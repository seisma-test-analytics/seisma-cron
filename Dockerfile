FROM python:3.5

ARG SEISMA_API_REPO_URL

RUN apt-get update -qqy && apt-get install -y cron git
RUN mkfifo --mode 0666 /var/log/cron.log

COPY docker-entrypoint.sh /

RUN git clone $SEISMA_API_REPO_URL /usr/local/src/seisma-api
WORKDIR /usr/local/src/seisma-api
RUN pip install -r requirements.txt -U
ENV PYTHONPATH /usr/local/src/seisma-api

COPY cron.d/ /etc/cron.d
RUN chown root:root -R /etc/cron.d && chmod 644 /etc/cron.d/*

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/bash", "-c", "cron -l -L 7 && tail -f /var/log/cron.log & wait $!"]
