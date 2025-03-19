
Repository for SD-WAN lab with k8s.

It contains a helm-repository, check out the [index.yaml](index.yaml)
 
The lab manual, in Spanish, is [here](doc/rdsv-p4.md)

In this branch the tunnel  between central offices has been replaced by a tunnel
between KNF-cpe-1 and bcg0. It can be tested by launching:

bin/prepare-k8slab
source ~/.bashrc

sudo vnx -f vnx/sdedge_nfv.xml -t

./sdedge1.sh

./sdwan1.sh

and then enter r1 console and ping r0

```bash
r1> ping 10.20.0.100
```
