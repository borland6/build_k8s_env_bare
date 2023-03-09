# Build K8S Lab Environment using Vagrant

build k8s env with bare metal ubuntu vm

*超感謝 justmeandopensource*😄 

#### The Vagrantfile is using VMware_Desktop provider and all scripts are modified/copy from [https://github.com/justmeandopensource/kubernetes](https://)

---

**VMware HostOnly (VMnet2) 設定**

1. Subnet IP: 172.16.16.0
2. Subnet mask: 255.255.255.0
3. Windows Host VMnet2 IP: 172.16.16.99

---

#### vagrant 起動VM 時會出現 "Error: Authentication failure. Retrying..."

##### 修改了原先使用的box image, 改使用 "bento/ubuntu-20.04" 來解決 #####
---------------------------------------------------------------

#### 執行完 vagrant up 即可生成自動建好K8S環境

K8S env:


|   K8S Node   |       HostName       | IP Address (VMnet2) | IP Address (VMnet8) |
| :-------------: | :--------------------: | :-------------------: | --------------------- |
| Control_Plane | kmaster.example.com |    172.16.16.100    | DHCP                |
|    Worker1    | kworker1.example.com |    172.16.16.101    | DHCP                |
|    Worker2    | kworker2.example.com |    172.16.16.102    | DHCP                |

###### 我還找不出來如何在Vagrantfile中指定第一張卡VMnet8(NAT)使用static IP, 所以只好先用二張網卡來避開這個問題, 等之後找到解法再來修正Vagrantfile若是大家若知道要如何寫, 也歡迎大家告訴我。🎉️
