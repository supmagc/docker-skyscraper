FROM debian:10 AS builder

RUN apt-get update && apt-get install -y build-essential qt5-default bash wget sudo

RUN mkdir skysource && \
    cd skysource && \
    wget -q -O - https://raw.githubusercontent.com/muldjord/skyscraper/master/update_skyscraper.sh | bash

FROM debian:10

RUN apt-get update && apt-get install -y libqt5gui5 libqt5xml5

ADD artwork.default.xml config.default.ini startup.sh /skyscraper/
COPY --from=builder /skysource /skysource/

VOLUME /config
VOLUME /games
VOLUME /cache

ENTRYPOINT ["/skyscraper/startup.sh"]