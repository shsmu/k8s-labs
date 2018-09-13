# Installation and Configuration Guide 
**[official Guide](https://github.com/goharbor/harbor/blob/master/docs/installation_guide.md)**

## Env
### Hosts
|Hostname|Ip|OS|Resource|
|---|---|---|---|
|prod-ops-harbor-01|192.168.1.251|CentOS 7|2C/4G/200GB|
|prod-ops-harbor-02|192.168.1.252|CentOS 7|2C/4G/200GB|

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
        "registry-mirrors": ["https://registry.docker-cn.com"]
      }
      EOF
    # service docker start
    # cd /usr/local/
    # wget https://storage.googleapis.com/harbor-releases/harbor-offline-installer-v1.5.3.tgz
    # tar xvf harbor-offline-installer-v1.5.3.tgz     
```

#### Configuring Harbor
Configuration parameters are located in the file **harbor.cfg**. 
```
    # cd harbor
    # cp harbor.cfg{,.bak}
    # sed -i 's/hostname = reg.mydomain.com/hostname = registry.sanyu.com/' harbor.cfg 
    # sed -i 's/harbor_admin_password = Harbor12345/harbor_admin_password = sanyu/' harbor.cfg 
    # sed -i 's/db_password = root123/db_password = sanyu/' harbor.cfg 
```

#### Runing Harbor
```
    # ./install.sh
```


