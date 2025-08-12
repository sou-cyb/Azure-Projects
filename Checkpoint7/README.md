# Checkpoint7 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Soufiane Berni**
- **STUDENT'S NUMBER: 108170218**
- **GITHUB USER ID: 108170218-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A - Creating and Configuring VMs - Using Portal](#Part-A---Creating-and-Configuring-VMs---Using-Portal)
2. [Part B - Enable IP Forwarding - Using Portal](#Part-B---Enable-IP-Forwarding---Using-Portal)
3. [Part C - Basic Connectivity - VM Configuration](#Part-C---Basic-Connectivity---VM-Configuration)
4. [Part D - Creating and Configuring VM Images - Using Portal](#Part-D---Creating-and-Configuring-VM-Images---Using-Portal)
5. [Part E - Azure Cost Analysis Charts](#Part-E---Azure-Cost-Analysis-Charts)
6. [Part F - Create Customized Azure Dashboard](#Part-F---Create-Customized-Azure-Dashboard)


### Part A - Creating and Configuring VMs - Using Portal

- **Question1:** 
What is the difference between Windows machine NSG and Linux machine NSG rules? Describe the difference? Do you need a rule for `ssh` or `rdp`? What happens if you delete specific `ssh` and `rdp` rules?

> `NSGs` are used to control network traffic that are allowed or denied passing to virtual machines `VMs` or vice-versa by defining inbound and outbound security rules such as port numbers, destination IP addresses. However, for `Windows machines` we use the Remote Desktop Protocol (RDP) that uses `TCP` port `3389` by default for remote administration, while Linux machines use the Secure Shell `SSH` that uses `TCP` port `22`. such as web servers `HTTPs` or database servers as `MySQL`. And if `SSH` rule for a Linux machine has been deleted will block the remote access via `SSH`, and the same result for Windows machine if the `RDP` rule has been removed as well.

- **Question2:**
The extracted Embed details from the `Azure Bash CLI` in the Portal that provide a comprehensive list of virtual machines, network security groups `NSGs`, network interface cards `NICs`, and `disks`.

1. The output of the command `az group list -o table`

```bash
Name                                      Location                  Status
---------------------                     -------------             ----------
Student-RG-954177                         Canadaeast                Succeeded
```

2. The output of the command `az vm list --output table`
```bash
Name                ResourceGroup                  Location                
-------             -------------------            -------------              
LR-18               Student-RG-954177               Canadaeast             
LS-18               Student-RG-954177               Canadaeast  
WC-18               Student-RG-954177               Canadaeast  
WS-18               Student-RG-954177               Canadaeast  
```               

3. The output of the command is `az network nic list --output table`
```bash
EnableAcceleratedNetworking   EnableIPForwarding   Location     MacAddress         Name       NicType    Primary   ProvisioningState   ResourceGroup       ResourceGuid                              VnetEncryptionSupported
--------------                -------------        --------     ---------          --------   --------   ------    --------------      -------------       ----------------                          ---------------
False                         False                canadaeast   00-22-48-6D-63-22  lr-29060   Standard   True      Succeeded           Student-RG-954177   76cc57a1-4e53-4ce8-aaf9-badc1b474917      False                                               
False                         False                canadaeast   00-22-48-6D-64-11  ls-34356   Standard   True      Succeeded           Student-RG-954177   561c57a1-4e53-4ce8-aaf9-fadc1b474126      False
False                         False                canadaeast   00-22-48-6D-33-17  wc-18393   Standard   True      Succeeded           Student-RG-954177   29ac57a1-4e53-4ce8-aaf9-eadc1b474920      False
False                         False                canadaeast   00-22-48-6D-43-19  ws-56781   Standard   True      Succeeded           Student-RG-954177   94cb57a1-4e53-4ce8-aaf9-bedc1b474891      False
```

4. The output of the command `az network nsg list --ouput table`
```bash
Location       Name          ProvisioningState       ResourceGroup           ResourceGuid
----------     --------      -----------------       --------------          --------------------
canadaeast     LR-18-nsg     Succeeded               Student-RG-954177       77f565be-bcf1-429b-8790-5dee6d117e12
canadaeast     LR-NSG-18     Succeeded               Student-RG-954177       67a4297f-8a13-4d9b-8231-94a784bcc1f6
canadaeast     LR18nsg397    Succeeded               Student-RG-954177       891ee53b-9f06-4e09-b0fe-5be84af448c2
canadaeast     LS-18-nsg     Succeeded               Student-RG-954177       3dd4e2c2-7d6f-4a76-8f5e-c39273edf5e7
canadaeast     WC18nsg499    Succeeded               Student-RG-954177       521abe90-1227-4ab4-9f4e-87d05b66e2b8
canadaeast     WS-NSG-18     Succeeded               Student-RG-954177       936ff8ab-8eef-44f6-aa71-2fcbe741d0ab
canadaeast     WS18nsg739    Succeeded               Student-RG-954177       98f565be-bcf1-429b-8790-5dee6d171c10                
````
5. The output of the command `az disk list --output table`
```bash
Name                                           ResourceGroup        Location        Sku        SizeGb    ProvisioningState    OsType
------                                         ---------------      ----------     ------      --------   ----------------    ----
WC-18_disk1_245c9bfb8be94711813bee2e4f8229d5   Student-RG-954177    canadaeast    Standard_LRS   127        Succeeded        Windows
LR-18_disk1_782c9bfb8be94711813bce2e4f8229b1   Student-RG-954177    canadaeast    Standard_LRS   1024       Succeeded        Linux
WS-18_disk1_892c9bfb8be94711813bae2e4f8229d9   Student-RG-954177    canadaeast    Standard_LRS   127        Succeeded        Windows
LS-18_disk1_136c9bfb8be94711813bac2e4f8229a2   Student-RG-954177    canadaeast    Standard_LRS   1024       Succeeded        Linux
```


### Part B - Enable IP Forwarding - Using Portal

- **Question1:**
The command that i used to extract the output as `json` format it can be run as follow: `az network nic ip-config show --name ip-forwarding --nic-name lr-29060 --resource-group Student-RG-954177 --query "enableIPForwarding" --output json`


- **Question2:**
The output, presented in `json` format and displays the status of IP forwarding as follows:

[./Images/IPForwarding.JPG](./Images/IPForwarding.JPG)
![IP Forwarding](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/IPForwarding.JPG)

- **Question3:**
Checking if the _IP Forwarding_ is enabled by using the following command: `az network nic show -g Student-RG-954177 -n lr-29060 --query "enableIpForwarding"`


### Part C - Basic Connectivity - VM Configuration

- **Question1:**
To remove the `Firewalld` service will apply the following commands:

```bash
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo yum remove firewalld
```

- **Question2:**
The command that we use to check the status of `iptables` for linux `VMs` is: `sudo systemctl status iptables`

[./Images/iptablesstatusLR-18.JPG](./Images/iptablesstatusLR-18.JPG)
![iptables status LR 18](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/iptablesstatusLR-18.JPG)

[./Images/iptablesstatusLS-18.JPG](./Images/iptablesstatusLS-18.JPG)
![iptables status LS 18](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/iptablesstatusLS-18.JPG)

- **Question3:**
The command that we use to check chain input is: `sudo iptables -L --line-numbers`

- **Question4:**
The iptables settings allow the attacks less vulnerable, because we can define the rules that allow inbound and outbound traffic for a specific services such as ports or protocols. Also, setting the policy to drop or reject to manage the traffic and limit incoming connections. 

```bash
sudo systemctl enable iptables
sudo systemctl start iptables
sudo systemctl status iptables
```
[./Images/Chaininput.JPG](./Images/Chaininput.JPG)
![Chain Input](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/Chaininput.JPG)

- **Question5:**
The command that shows the hostname in `LR-18` and `LS-18` as follows:

[./Images/hostnameLR-18.JPG](./Images/hostnameLR-18.JPG)
![Hostname LR 18](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/hostnameLR-18.JPG)

[./Images/hostnameLS-18.JPG](./Images/hostnameLS-18.JPG)
![Hostname LS 18](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/hostnameLS-18.JPG)

### Part D - Creating and Configuring VM Images - Using Portal
- **Question1:**
`az image list --output table`

[./Images/VMsImages.JPG](./Images/VMsImages.JPG)
![VMs Images](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/VMsImages.JPG)

- **Question2:**
`az vm list --output table`

[./Images/DeletedVMs.JPG](./Images/DeletedVMs.JPG)
![Deleted VMs](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/DeletedVMs.JPG)

- **Question3:**
When recreating VMs from the images and establishing basic connectivity, the time taken for the entire process can was about 2 minutes, however the time was varing between, image size, network conditions..., use managed disks instead of umnanaged disks for vm storage, azure avilability sets or zones.

### Part E - Azure Cost Analysis Charts

1. [./Images/Resource1.JPG](./Images/Resource1.JPG)

![DailyCosts Resource1](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/Resource1.JPG)

2. [./Images/Service.JPG](./Images/Service.JPG)

![DailyCosts Service](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/Service.JPG)

3. [./Images/Resource2.JPG](./Images/Resource2.JPG)

![DailyCosts Resource2](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/Resource2.JPG)

4. [./Images/ServiceName.JPG](./Images/ServiceName.JPG)

![Service Name](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/ServiceName.JPG)

5. [./Images/ServiceFamily.JPG](./Images/ServiceFamily.JPG)

![Service Family](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/ServiceFamily.JPG)

6. [./Images/Product.JPG](./Images/Product.JPG)

![Last Month Product](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/Product.JPG)


### Part F - Create Customized Azure Dashboard

[./Images/Dashboard.JPG](./Images/Dashboard.JPG)

![Dashboard Sample-18](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Images/Dashboard.JPG)









