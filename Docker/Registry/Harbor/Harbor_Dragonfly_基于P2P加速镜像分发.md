# Harbor Dragonfly 基于 P2P 加速镜像分发
<br>
<div align="center">
    <img src="./img/dfget-combine-container.png" width="1024px">
    <br>
</div>

## Steps

1. Start SuperNode on Docker Container;
2. Install Dragonfly Client;
3. Config Dragonfly Client Point To SuperNode(s);
4. Config Container Daemon;
5. Use Dragonfly to Pull an Image;

### Start SuperNode on Docker Container

```bash
imageName="registry.cn-hangzhou.aliyuncs.com/alidragonfly/supernode:0.2.0"
docker pull ${imageName}
docker run -d -p 8001:8001 -p 8002:8002 ${imageName}
```

### Install Dragonfly Client
* [df-client: linux 64-bit](https://github.com/alibaba/Dragonfly/releases/download/v0.2.0/df-client_0.2.0_linux_amd64.tar.gz)
```
# wget https://github.com/alibaba/Dragonfly/releases/download/v0.2.0/df-client_0.2.0_linux_amd64.tar.gz
# tar zxf df-client_0.2.0_linux_amd64.tar.gz -C /usr/local/
# echo 'PATH=$PATH:/usr/local/df-client' > /etc/profile.d/df-client.sh
# source /etc/profile.d/df-client.sh
```
### Config Dragonfly Client Point To SuperNode(s)
```
# cat <<EOF > /etc/dragonfly.conf 
[node]
address=dragonfly.sanyu.com,dragonfly02.sanyu.com,dragonfly03.sanyu.com
EOF
```

### 方式一： Config Container Daemon
* 启动 dfget proxy(即 df-damoen)  launch dfdaemon on port:65001(default)
```
# nohup dfdaemon --registry http://registry.sanyu.com -ratelimit 600M &
# sed -i 's@https://registry.docker-cn.com@http://127.0.0.1:65001@' /etc/docker/daemon.json
# like this:
{
    "registry-mirrors": ["http://127.0.0.1:65001"]
}
# systemctl daemon-reload
# systemctl restart docker
```

### 方式二： HTTP 代理服务模式 (not works )
* 启动 dfget proxy(即 df-damoen)  launch dfdaemon on port:65001(default)
```
# nohup dfdaemon --registry https://registry.sanyu.com -ratelimit 600M &
# mkdir -p /etc/systemd/system/docker.service.d
# cat <<EOF > /etc/systemd/system/docker.service.d/http-proxy.conf 
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:65001"
EOF
# systemctl daemon-reload
# systemctl restart docker
# systemctl show --property=Environment docker
Environment=GOTRACEBACK=crash DOCKER_HTTP_HOST_COMPAT=1 PATH=/usr/libexec/docker:/usr/bin:/usr/sbin HTTP_PROXY=http://127.0.0.1:65001
```

### Use Dragonfly to Pull an Image
Actually  pull from "registry.sanyu.com" not "docker.io"
```
# docker pull project01/alidragonfly
Using default tag: latest
Trying to pull repository docker.io/project01/alidragonfly ... 
latest: Pulling from docker.io/project01/alidragonfly
7dc0dca2b151: Pulling fs layer 
```