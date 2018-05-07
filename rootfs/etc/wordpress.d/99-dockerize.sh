#!/usr/bin/env bash

echo "Finishing wordpress launch..."
DOCKERIZE="dockerize"

case ${WORDPRESS_ACCESSLOG_DESTINATION} in
  "stdout")
    DOCKERIZE="${DOCKERIZE} -stdout ${WORDPRESS_ACCESSLOG_LOCATION}"
    ;;
  "stderr")
    DOCKERIZE="${DOCKERIZE} -stderr ${WORDPRESS_ACCESSLOG_LOCATION}"
    ;;
esac

case ${WORDPRESS_ERRORLOG_DESTINATION} in
  "stdout")
    DOCKERIZE="${DOCKERIZE} -stdout ${WORDPRESS_ERRORLOG_LOCATION}"
    ;;
  "stderr")
    DOCKERIZE="${DOCKERIZE} -stderr ${WORDPRESS_ERRORLOG_LOCATION}"
    ;;
esac

exec ${DOCKERIZE}

true
