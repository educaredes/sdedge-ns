#!/bin/bash
  
# Requires the following variables
# OSMNS: OSM namespace in the cluster vim
# NETNUM: used to select external networks
# CUSTUNIP: the ip address for the customer side of the tunnel
# VNFTUNIP: the ip address for the vnf side of the tunnel
# VCPEPUBIP: the public ip address for the vcpe
# VCPEGW: the default gateway for the vcpe

set -u # to verify variables are defined
: $OSMNS
: $NETNUM
: $CUSTUNIP
: $VNFTUNIP
: $VCPEPUBIP
: $VCPEGW

export KUBECTL="microk8s kubectl"

## 0. Obtener deployment ids de las vnfs
echo "## 0. Obtener deployment ids de las vnfs"
export VACC="deploy/access$NETNUM-accesschart"
export VCPE="deploy/cpe$NETNUM-cpechart"
export VWAN="deploy/wan$NETNUM-wanchart"

./start_corpcpe.sh
./start_sdedge.sh

echo "--"
echo "$(basename "$0")"
echo "K8s deployments para la red $NETNUM:"
echo $VACC
echo $VCPE
echo $VWAN
