#  Harbor 主从配置
Images replication is used to replicate repositories from one Harbor instance to another.
[replicating-images](https://github.com/goharbor/harbor/blob/master/docs/user_guide.md#replicating-images) 

## Env
### Hosts
|Hostname|Ip|OS|Resource|
|---|---|---|---|
|prod-ops-harbor-01|192.168.1.251|CentOS 7|2C/4G/200GB|
|prod-ops-harbor-02|192.168.1.252|CentOS 7|2C/4G/200GB|

## Steps

1. Ensure harbor is  **[installed](https://github.com/shsmu/k8s-labs/blob/master/Docker/Registry/Harbor/Harbor_安装配置.md)** on all nodes;
2. Creating a replication rule;
3. Listing and stopping replication jobs;
4. Starting a replication manually;

add_new_project
<br>
<div align="center">
    <img src="../img/add_new_project.png" width="1024px">
    <br>
</div>
add_new_repo
<br>
<div align="center">
    <img src="../img/add_new_repo.png" width="1024px">
    <br>
</div>
add_new_rules
<br>
<div align="center">
    <img src="../img/add_new_rules.png" width="1024px">
    <br>
</div>
syncing
<br>
<div align="center">
    <img src="../img/sync.png" width="1024px">
    <br>
</div>
sync_finished
<br>
<div align="center">
    <img src="../img/sync_finished.png" width="1024px">
    <br>
</div>



