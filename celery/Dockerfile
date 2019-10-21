FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y python-pip python-dev

ENV CELERY_BROKER_URL redis://redis:6379/0
ENV CELERY_RESULT_BACKEND redis://redis:6379/0
ENV C_FORCE_ROOT true

COPY . /flask-celery
WORKDIR /flask-celery

RUN pip install -r requirements.txt

ENTRYPOINT celery -A tasks worker --loglevel=info
