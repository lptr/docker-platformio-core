FROM python:3.10.5-slim

ENV APP_VERSION="6.0.2" \
    APP="platformio-core"

LABEL app.name="${APP}" \
      app.version="${APP_VERSION}" \
      maintainer="Sebastian Glahn <hi@sgla.hn>"

RUN pip install -U platformio==${APP_VERSION} && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio && \
    apt update && \
    apt install -y git g++ && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

USER 1001

WORKDIR /workspace

ENTRYPOINT ["platformio"]
