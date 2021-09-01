FROM linuxserver/ffmpeg

RUN apt update && \
    apt install -y --no-install-recommends python3 python3-pip python3-setuptools socat && \
    rm -rf /var/lib/apt/lists/*

COPY --from=nuvlabox/mqtt-utils /opt/mqtt_utils /opt/mqtt_utils

ENV PATH /opt/mqtt_utils:$PATH

RUN pip3 install --no-cache-dir -U -r /opt/mqtt_utils/requirements.txt

ENTRYPOINT ["bash"]
