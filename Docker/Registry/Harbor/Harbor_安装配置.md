# Installation and Configuration Guide 
**[official Guide](https://github.com/goharbor/harbor/blob/master/docs/installation_guide.md)**

## Env
### Hosts
|Hostname|Ip|OS|Resource|
|---|---|---|---|
|prod-ops-harbor-01|192.168.1.251|CentOS 7|2C/4G/200GB|
|prod-ops-harbor-02|192.168.1.252|CentOS 7|2C/4G/200GB|

**[Hyper-V](https://github.com/shsmu/k8s-labs/blob/master/Hyper-V/PowerShell/create_vm_harbor.ps1)**
### Software
|Software|Version|Description|
|---|---|---|
|Python|version 2.7 or higher|Note that you may have to install Python on Linux distributions (Gentoo, Arch) that do not come with a Python interpreter installed by default|
|Docker engine|version 1.10 or higher|For installation instructions, please refer to: https://docs.docker.com/engine/installation/|
|Docker Compose|version 1.6.0 or higher|For installation instructions, please refer to: https://docs.docker.com/compose/install/|
|Openssl|latest is prefered|Generate certificate and keys for Harbor|
### Network ports 
|Port|Protocol|Description|
|---|---|---|
|443|HTTPS|Harbor UI and API will accept requests on this port for https protocol|
|4443|HTTPS|Connections to the Docker Content Trust service for Harbor, only needed when Notary is enabled|
|80|HTTP|Harbor UI and API will accept requests on this port for http protocol|

## Installation Steps

The installation steps boil down to the following

1. Download the installer;
2. Configure **harbor.cfg**;
3. Run **install.sh** to install and start Harbor;


#### Downloading the installer:

The binary of the installer can be downloaded from the [release](https://github.com/goharbor/harbor/releases) page. Choose either online or offline installer. Use *tar* command to extract the package.

Offline installer:
```
# yum -y install epel-release
# yum -y install docker docker-compose
# cat <<EOF > /etc/docker/daemon.json 
{
    "registry-mirrors": ["https://registry.docker-cn.com"],
    "insecure-registries": ["registry.sanyu.com", "prod-ops-harbor-01.sanyu.com", "prod-ops-harbor-02.sanyu.com"]
}
EOF
# service docker start
# wget https://storage.googleapis.com/harbor-releases/harbor-offline-installer-v1.5.3.tgz
# tar xvf harbor-offline-installer-v1.5.3.tgz     
```

#### Configuring Harbor
Configuration parameters are located in the file **harbor.cfg**. 
```
# cd harbor
# cp harbor.cfg{,.bak}
# sed -i "s/hostname = reg.mydomain.com/hostname = ${HOSTNAME}/" harbor.cfg 
# sed -i 's/harbor_admin_password = Harbor12345/harbor_admin_password = sanyu/' harbor.cfg 
# sed -i 's/db_password = root123/db_password = sanyu/' harbor.cfg 
```

#### Runing Harbor
```
# ./install.sh
```
### Test
```
# docker login registry.sanyu.com
Username: admin
Password: 
Login Succeeded
# docker tag nginx registry.sanyu.com/house/nginx:latest
# docker push registry.sanyu.com/house/nginx:latest
The push refers to a repository [registry.sanyu.com/house/nginx]
579c75bb43c0: Pushed 
67d3ae5dfa34: Pushed 
8b15606a9e3e: Pushed 
latest: digest: sha256:c0b69559d28fb325a64c6c8f47d14c26b95aa047312b29c699da10380e90b4d7 size: 948
```


### Managing Harbor's lifecycle
You can use docker-compose to manage the lifecycle of Harbor. Some useful commands are listed as follows (must run in the same directory as *docker-compose.yml*).

Stopping Harbor:
```
# docker-compose stop
Stopping nginx ... done
Stopping harbor-jobservice ... done
Stopping harbor-ui ... done
Stopping harbor-db ... done
Stopping registry ... done
Stopping harbor-log ... done
```  
Restarting Harbor after stopping:
```
# docker-compose start
Starting log ... done
Starting ui ... done
Starting mysql ... done
Starting jobservice ... done
Starting registry ... done
Starting proxy ... done
```  

To change Harbor's configuration, first stop existing Harbor instance and update ```harbor.cfg```. Then run ```prepare``` script to populate the configuration. Finally re-create and start Harbor's instance:
```
# docker-compose down -v
# vim harbor.cfg
# prepare
# docker-compose up -d
``` 

Removing Harbor's containers while keeping the image data and Harbor's database files on the file system:
```
# docker-compose down -v
```  

Removing Harbor's database and image data (for a clean re-installation):
```sh
# rm -r /data/database
# rm -r /data/registry
```
