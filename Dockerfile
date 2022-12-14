FROM python:3.8-slim

RUN apt-get update
RUN apt-get install cron \ 
  curl \
  entr \  
  gcc -y

RUN touch /var/spool/cron/crontabs/pi
RUN pip3 install -U "organize-tool[textract]"

COPY        ./entrypoint.sh /
RUN         chmod +x /entrypoint.sh

RUN useradd -ms /bin/bash pi
USER pi
WORKDIR /home/pi

ENTRYPOINT  ["/entrypoint.sh"]
