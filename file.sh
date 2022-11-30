#!/bin/bash

if [[ -f "/opt/vol/state.json" ]]
then 
  /opt/tap/bin/tap-mysql \
        -c /opt/mysql/config.json \
        --state /opt/vol/state.json \
        --properties /opt/mysql/properties.json |\
        /opt/target/bin/target-postgres \
        -c /opt/postgres/config.json 
else
  /opt/tap/bin/tap-mysql \
        -c /opt/mysql/config.json \
        --properties /opt/mysql/properties.json |\
        /opt/target/bin/target-postgres \
        -c /opt/postgres/config.json 
fi
