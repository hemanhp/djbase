FROM python:3.12.2-alpine3.19

LABEL org.opencontainers.image.authors="heman.1682@gmail.com"
LABEL version="0.1"


ENV PYTHONUNBUFFERED 1
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1


COPY ./requirements.txt /common-requirements.txt


RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip
RUN apk add --update --no-cache postgresql-client
RUN apk add --update  postgresql-client build-base postgresql-dev musl-dev linux-headers libffi-dev libxslt-dev libxml2-dev
RUN    apk add --update --no-cache --virtual .tmp-deps \
        build-base postgresql-dev musl-dev linux-headers libffi-dev libjpeg zlib-dev jpeg-dev gcc musl-dev libxslt libxml2


RUN /py/bin/pip install -r /common-requirements.txt
