#### Tutorials:

Env Prepare
* [Create VM Using PowerShell](../../PowerShell/README.md)
* [Create Master](../../PowerShell/create_vm_cka_master.ps1)
* [Create Nodes](../../PowerShell/create_vm_cka_nodes.ps1)
* [Cobbler Install OS]()
```
[root@k8s-lab docker-bind]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
2583442513e0        shsmu/cka-bind      "/start.sh"         31 minutes ago      Up 31 minutes                           dockerbind_bind_1
039cbe03a5f8        shsmu/cka-cobbler   "/start.sh"         6 weeks ago         Up 45 minutes                           dockercobbler_cobbler_1
099473d3b700        nginx:1.11.6-alpine   "nginx -g 'daemon ..."   8 hours ago         Up 8 hours          443/tcp, 0.0.0.0:8080->80/tcp   dockerrepo_nginx_1
[root@k8s-lab ~]# tree /mnt/
/mnt/
├── etcd-io
│   └── etcd
│       └── releases
│           └── download
│               └── v3.2.24
│                   └── etcd-v3.2.24-linux-amd64.tar.gz
└── kubernetes-release
    └── release
        ├── v1.10.8
        │   └── bin
        │       └── linux
        │           └── amd64
        │               ├── kube-apiserver
        │               ├── kube-controller-manager
        │               ├── kubectl
        │               ├── kubelet
        │               ├── kube-proxy
        │               └── kube-scheduler
        ├── v1.11.2
        │   └── bin
        │       └── linux
        │           └── amd64
        │               ├── kube-apiserver
        │               ├── kube-controller-manager
        │               ├── kubectl
        │               ├── kubelet
        │               ├── kube-proxy
        │               └── kube-scheduler
        └── v1.12.0-rc.1
            └── bin
                └── linux
                    └── amd64
                        ├── kube-apiserver
                        ├── kube-controller-manager
                        ├── kubectl
                        ├── kubelet
                        ├── kube-proxy
                        └── kube-scheduler
```

* [Install](https://github.com/shsmu/k8s-install/tree/bash)
