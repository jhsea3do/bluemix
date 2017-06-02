#!/bin/sh
BLUEMIX_API_ENDPOINT=https://api.ng.bluemix.net
bx update
bx plugin install container-service -r Bluemix
bx login -a $BLUEMIX_API_ENDPOINT
bx cs init
bx cs cluster-config mycluster
