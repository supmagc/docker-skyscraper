#!/bin/sh

if [ ! -f /config/config.ini ]; then
    cp /skyscraper/config.default.ini /config/config.ini
fi

if [ ! -f /config/artwork.xml ]; then
    cp /skyscraper/artwork.default.xml /config/artwork.xml
fi

/skysource/Skyscraper -c /config/config.ini "$@"
