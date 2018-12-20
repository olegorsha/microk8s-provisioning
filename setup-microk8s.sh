#!/bin/bash

vagrant ssh -c "microk8s.enable dns dashboard"

KUBECFG_FILE_NAME=microk8s.conf
vagrant ssh -c "kubectl config view --raw" | sed "s/127.0.0.1/172.42.42.101/" > $KUBECFG_FILE_NAME

KUBECONFIG=$KUBECFG_FILE_NAME

get_replicas() {
    kubectl get deployment kubernetes-dashboard -n kube-system -o 'jsonpath={.status.readyReplicas}'
}

while [[ $(get_replicas) -lt 1 ]]; do
  sleep=$((sleep+5))
  if [[ $sleep == "180" ]]; then
    echo "timeout - was not possible to enable kubernate serivces in $sleep sec"
    exit 1
  fi
done

kubectl replace -f dashboard-service-nodeport.yaml --force

TOKEN=$(kubectl get sa kubernetes-dashboard -n kube-system -o json | jq -r .secrets[].name)
ACCESS_TOKEN=$(kubectl get secret $TOKEN -nkube-system -o json | jq -r .data.token | base64 -d)

echo "microk8s dashboard url: https://172.42.42.101:32323"
echo "dashboard access token:"
echo $ACCESS_TOKEN

