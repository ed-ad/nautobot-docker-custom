FROM ghcr.io/nautobot/nautobot:2.4.7-py3.12

USER root

COPY ./plugin_requirements.txt /

RUN apt-get update \
    && apt-get install libxmlsec1-dev libxmlsec1-openssl -y

RUN pip3 install --no-warn-script-location -r /plugin_requirements.txt

USER nautobot

