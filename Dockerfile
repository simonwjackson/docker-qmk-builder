FROM qmkfm/base_container

ARG KEYBOARD
ARG KEYMAP

MAINTAINER Simon W. Jackson <hello@simonwjackson.io>

RUN apt-get update \
    && apt-get install --no-install-recommends -y entr

VOLUME /qmk_firmware
WORKDIR /qmk_firmware

CMD while true; do \
    find /qmk_firmware/keyboards/${KEYBOARD}/* \
    | entr -r make keyboard=${KEYBOARD} keymap=${KEYMAP}; \
done
