FROM ghcr.io/nautobot/nautobot:3.2.3-py3.13

USER root

COPY ./plugin_requirements.txt /

RUN apt-get update \
    && apt-get install libxmlsec1-dev libxmlsec1-openssl -y

RUN pip3 install --no-warn-script-location -r /plugin_requirements.txt

USER nautobot
