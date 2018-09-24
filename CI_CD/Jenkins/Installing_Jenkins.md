# Installing Jenkins 

The procedures on this page are for new installations of Jenkins on a single/local machine.


## Installation platforms:

### Installing Docker
```
# yum -y install docker
# systemctl start docker
```

### Downloading and running Jenkins in Docker
```
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean
```

### Post-installation setup wizard

Unlocking Jenkins

1、Browse to http://ci.sanyu.com:8080 (or whichever port you configured for Jenkins when installing it) and wait until the Unlock Jenkins page appears.

2、From the Jenkins console log output, copy the automatically-generated alphanumeric password (between the 2 sets of asterisks).
```
# docker logs `docker ps | grep -v CONTAINER| head -n 1| awk '{print $1}'` | grep -A 1 "Please use the following password to proceed to installation:"
```
3、On the Unlock Jenkins page, paste this password into the Administrator password field and click Continue.