# build_k8s_env_bare
build k8s env with bare metal ubuntu vm

*超感謝 justmeandopensource*   
#### The Vagrantfile is using VMware_Desktop provider and all scripts are modified/copy from https://github.com/justmeandopensource/kubernetes

----
**VMware NAT (VMnet8) 設定** 
   1. enabled DHCP
   2. Subnet IP: 172.16.16.0
   3. Subnet mask: 255.255.255.0
   4. Gateway IP: 172.16.16.2
   5. Starting IP address: 172.16.16.200
   6. Ending IP address: 172.16.16.254
----   
#### vagrant 起動VM 時會出現 "Error: Authentication failure. Retrying..." ####
*修改了原先使用的box image, 改使用 "bento/ubuntu-20.04" 來解決*
----
#### 執行完 vagrant up 即可生成自動建好K8S環境 ###
K8S env:
| K8S Node      | HostName             | IP Address    |
|:-------------:|:--------------------:|:-------------:|
| Control_Plane | kmaster.example.com  | 172.16.16.100 |
| Worker1       | kworker1.example.com | 172.16.16.101 |
| Worker2       | kworker2.example.com | 172.16.16.102 |


