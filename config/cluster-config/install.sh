#!/usr/bin/env bash
echo "Applying Cluster Config" 
oc get project $1

if [ $? -eq 1 ];then
  oc new-project $1
fi

helm template cluster-config ./helm/cluster-configuration/ --set namespace=$1 | oc apply -f-

