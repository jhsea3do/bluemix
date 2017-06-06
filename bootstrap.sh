#!/bin/sh

if [ -f "$HOME/.bluemix_env" ]; then
  echo "bluemix profile not exists!"
  . $HOME/.bluemix_env
else
  export BLUEMIX_PLUGIN_REPO=Bluemix
  export BLUEMIX_API_ENDPOINT=https://api.ng.bluemix.net
  export BLUEMIX_CS_CLUSTER=mycluster
  export BLUEMIX_IC_NAMESPACE=shjihai
fi

echo "
BLUEMIX_API_ENDPOINT=$BLUEMIX_API_ENDPOINT
BLUEMIX_CS_CLUSTER=$BLUEMIX_CS_CLUSTER
BLUEMIX_IC_NAMESPACE=$BLUEMIX_IC_NAMESPACE
"

if [ ! -f "$HOME/.bluemix/config.json" ]; then
  echo "# bluemix data not exists!"
  bx update
  bx plugin install container-service -r $BLUEMIX_PLUGIN_REPO
  bx plugin install IBM-Containers -r $BLUEMIX_PLUGIN_REPO
  bx plugin install vpn -r $BLUEMIX_PLUGIN_REPO
fi

bx login -a $BLUEMIX_API_ENDPOINT

bx cs init
bx cs cluster-config $BLUEMIX_CS_CLUSTER

bx ic namespace-set $BLUEMIX_IC_NAMESPACE
bx ic init

bash
