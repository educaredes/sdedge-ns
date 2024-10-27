#!/bin/bash
export OSMNS  # needs to be defined in calling shell
export SIID="$NSID1" # $NSID1 needs to be defined in calling shell

export NETNUM=1  # used to select external networks

# CUSTUNIP: the ip address for the home side of the tunnel
export CUSTUNIP="10.255.0.2"

# CUSTPREFIX: the customer private prefix
export CUSTPREFIX="10.20.1.0/24"

# VNFTUNIP: the ip address for the vnf side of the tunnel
export VNFTUNIP="10.255.0.1"

# VCPEPUBIP: the public ip address for the vcpe
export VCPEPUBIP="10.100.1.1"

# VCPEGW: the default gateway for the vcpe
export VCPEGW="10.100.1.254"

# OSM SECTION
#./osm_corpcpe_start.sh

# HELM SECTION
helm -n $OSMNS uninstall access$NETNUM cpe$NETNUM
sleep 15

helm -n $OSMNS install access$NETNUM accesschart-0.1.0.tgz
helm -n $OSMNS install cpe$NETNUM cpechart-0.1.0.tgz
sleep 10

./k8s_corpcpe_start.sh