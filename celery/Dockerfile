FROM ubuntu

RUN apt-get update -y && apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y octave
RUN export LC_ALL=C
ENV CELERY_BROKER_URL redis://redis:6379/0
ENV CELERY_RESULT_BACKEND redis://redis:6379/0
ENV C_FORCE_ROOT true

COPY . /flask-celery
WORKDIR /flask-celery

RUN pip3 install -r requirements.txt

ENTRYPOINT celery -A tasks worker --loglevel=info