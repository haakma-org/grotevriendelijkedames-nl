#!/bin/bash

function read_config() {

    SQL_USER=
    SQL_PASSWORD=
    SQL_SCHEMA=

    PROPERTY_FILE=${1}

    if [ -f "${PROPERTY_FILE}" ]
    then
        echo "[INFO] ${PROPERTY_FILE} found"

        while IFS='=' read -r key value
            do
                key=$(echo ${key} | tr '.' '_')
                eval "${key}='${value}'"
            done < "${PROPERTY_FILE}"

        echo "[INFO] Export SQL_USER=" ${SQL_USER}
        echo "[INFO] Export SQL_PASSWORD=" ${SQL_PASSWORD}
        echo "[INFO] Export SQL_SCHEMA=" ${SQL_SCHEMA}
        export SQL_USER=${SQL_USER}
        export SQL_PASSWORD=${SQL_PASSWORD}
        export SQL_SCHEMA=${SQL_SCHEMA}
    else
        echo "[ERROR] ${PROPERTY_FILE} not found"
        exit 1
    fi
}