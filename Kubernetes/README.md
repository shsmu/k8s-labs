# Tutorials:
[在线体验](https://kubernetes.io/docs/tutorials/kubernetes-basics/create-cluster/cluster-interactive/)

      The online terminal is a pre-configured Linux environment that can be used as a regular console (you can type commands). 
      Clicking on the blocks of code followed by the ENTER sign will execute that command in the terminal.


## Install

- [x] [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
- [ ] [Ansible](https://github.com/shsmu/k8s-labs)
- [ ] [Yum](https://github.com/shsmu/k8s-labs)
- [ ] [Kubeadm](https://github.com/shsmu/k8s-labs)
- [ ] [Binary](https://github.com/shsmu/k8s-labs)
   - [ ] [Shell scripts](https://github.com/shsmu/k8s-labs)
   - [x] [Kubernetes the hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way/tree/e8d728d0162ebcdf951464caa8be3a5b156eb463)
   - [x] [Master HA](https://github.com/Lentil1016/kubeadm-ha)
   
   
## CKA labs

- [ ] 1 [12% - Installation, Conﬁguration & Validation](https://github.com/shsmu/k8s-labs)
- [ ] 2 [19% - Core Concepts]()                
    - [ ] 2.1 Namespace 
        - [ ] 2.1.1 创建 Namespace 
        - [ ] 2.1.2 查看 Namespace 
        
    - [ ] 2.2 创建 pod 
        - [ ] 2.2.1 指定 Namespace 下创建 Pod 
        - [ ] 2.2.2 查看 Pod 
        
    - [ ] 2.3 创建 Deployment
        - [ ] 2.3.1 部署一个 Deployment
        - [ ] 2.3.2 查看 Deployment 详情
        - [ ] 2.3.3 查看 Deployment Pod 标签
        - [ ] 2.3.4 修改某个副本的标签       
        - [ ] 2.3.5 再次查看 Deployment 详情
                
    - [ ] 2.4 创建 Service
        - [ ] 2.4.1 创建一个 Service
        - [ ] 2.4.2 查看 Service       
        - [ ] 2.4.3 修改 Service 类型为 NodePort
        - [ ] 2.4.4 再次查看 Service，NodePort 访问验证可用性
        
    - [ ] 2.5  Label and Selector
        - [ ] 2.5.1 创建一个 Service
        - [ ] 2.5.2 查看 Service
        - [ ] 2.5.3 查看 endpoint
        - [ ] 2.5.4 查看 Selector      

    - [ ] 2.10  Ingress
        - [ ] 2.10.1 创建一个 Ingress  
        - [ ] 2.10.2 创建一个 backend 服务
        - [ ] 2.10.3 定义 Ingress 策略
        - [ ] 2.10.4 测试                  

- [ ] 3 [8% - Application Lifecycle Management]()
    - [ ] 3.1  Deployment rolling updates
        - [ ] 3.1.1 升级一个 Deployment 下的镜像版本
        - [ ] 3.1.2 查看升级记录历史
        - [ ] 3.1.3 记录一次升级记录
        - [ ] 3.1.4 滚动升级并再次查看       
            
    - [ ] 3.2  Deployment rollbacks
        - [ ] 3.2.1  查看升级记录历史
        - [ ] 3.2.2  回滚到上一个版本
        - [ ] 3.2.3  回滚到一个指定版本
        - [ ] 3.2.4  实时监控回滚过程       
    
    - [ ] 3.3  Scale applications
        - [ ] 3.3.1  增加副本数量到10 
        - [ ] 3.3.2  观察 Pods 数量变化
    
    - [ ] 3.4  Self-healing application
        - [ ] 3.4.1  Kill Pods       
        - [ ] 3.4.2  实时监控 Pods       
        - [ ] 3.4.3  隔离一个 Node
        - [ ] 3.4.4  观察 endpoint 变化          
         
- [ ] 4 [7% - Storage]() 
    - [ ] 4.1  Volumes
        - [ ] 4.1.1 创建一个 Pod 包含 Nginx 和 Busybox 两个容器并且挂载同一个 emptyDir   
        - [ ] 4.1.2 查看两个容器挂载卷目录 
        - [ ] 4.1.3 Busybox 在挂载卷下创建一个 index.html 文件
        - [ ] 4.1.4 进入 Nginx 容器查看
        - [ ] 4.1.5 创建一个 Pod 挂载宿主机的目录 hostPath
        - [ ] 4.1.6 进入容器在挂载目录下创建文件
        - [ ] 4.1.7 查看 Pod 运行在哪个 Node 上
        - [ ] 4.1.8 登陆 Node 查看 hostPath 下是否存在刚才创建的文件
    
    - [ ] 4.2  Secrets
        - [ ] 4.2.1 创建一个 secret  
        - [ ] 4.2.2 创建一个 Pod 指定 secretName 添加到 Volume 中          
             
    - [ ] 4.3  Configmaps
        - [ ] 4.13.1 创建一个 redis_cluster_master.cnf 的配置文件   
        - [ ] 4.13.2 创建名为 redis_cluster_master_map 的 configmap 从 redis_cluster_master.cnf 文件导入          
        - [ ] 4.13.3 查看刚才创建的 configmap             
        - [ ] 4.13.4 创建一个 redis_cluster_slave.cnf 的配置文件    
        - [ ] 4.13.5 创建名为 redis_cluster_slave_map 的 configmap 从 redis_cluster_slave.cnf 文件导入          
        - [ ] 4.13.6 创建两个 Pod 使用不同的 configmap
        - [ ] 4.13.7 进入两个容器查看是否是各自挂载的文件内容              
               
          
- [ ] 5 [5% - Scheduling]()               
- [ ] 6 [11% - Networking]()
- [ ] 7 [12% - Security]() 
- [ ] 8 [5% - Logging/Monitoring]()    
- [ ] 9 [11% - Cluster Maintenance]() 
- [ ] 10 [10% - Troubleshooting]() 