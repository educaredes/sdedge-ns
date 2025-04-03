
Repository for SD-WAN lab with k8s.

It contains a helm-repository, check out the [index.yaml](index.yaml)
 
The lab manual, in Spanish, is [here](doc/rdsv-p4.md)

In this branch the tunnel  between central offices has been replaced by a tunnel
between KNF-cpe-1 and bcg0. It can be tested by launching:

```bash
bin/prepare-k8slab

source ~/.bashrc

sudo vnx -f vnx/sdedge_nfv.xml -t

./sdedge1.sh

./sdwan1.sh
```


and then enter r1 console and ping r0

```bash
# from r1
ping 10.20.0.100
```

Then, the tunnel between KNF-cpe-2 and bcg0 can be launched:

```bash
./sdedge2.sh # creating this file is an exercise
./sdwan2.sh
```

and tested:

```bash
# from r2
ping 10.20.0.100
```

The traffic between h1 and h2 will then go through bcg0, it can be tested:

```bash
# from h1
ping 10.20.2.2
```

