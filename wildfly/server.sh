#!/bin/bash

BASE_DIR=`pwd`/$(dirname $0)
HORNETQ_CLI_PATH="$BASE_DIR/cli"
WILDFLY_VERSION='8.0.0.CR1'
DOWNLOAD_URL="http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.zip"
WILDFLY_PATH="$BASE_DIR/wildfly-$WILDFLY_VERSION"

if [ "$1" == "stop" ]; then
    echo "Server stopped!"
    for i in `ps -ef | grep -i "wildfly-$WILDFLY_VERSION/modules" | awk '{print $2}'`
    do
      kill -9 $i 2> /dev/null
    done
    exit 0
fi

if [ -d "$WILDFLY_PATH" ]; then
    rm -rf $WILDFLY_PATH/
fi

if [ ! -f "$WILDFLY_PATH.zip" ]; then
    wget -c $DOWNLOAD_URL -P $BASE_DIR/
fi

if [ -f "$WILDFLY_PATH.zip" ]; then
    unzip $WILDFLY_PATH.zip -d $BASE_DIR/
else
    echo "The path does not contain a wildfly distribution"
    exit 1
fi

nohup $WILDFLY_PATH/bin/standalone.sh -c standalone-full.xml &
sleep 7
$WILDFLY_PATH/bin/jboss-cli.sh --file="$HORNETQ_CLI_PATH/hornetq-batch-config.cli" &
sleep 4
$WILDFLY_PATH/bin/add-user.sh --silent -a guest guest -g guest
sleep 4
echo "Server started and configured!"
