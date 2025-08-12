# Checkpoint8 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Soufiane Berni**
- **STUDENT'S NUMBER: 108170218**
- **GITHUB USER ID: 108170218-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A - Creating and Configuring VMs - Using Azure CLI Scripts](#Part-A---Creating-and-Configuring-VMs---Using-Azure-CLI-Scripts)
2. [Part B - Basic Connectivity - Linux VMs Firewall Setting](#Part-B---Basic-Connectivity---Linux-VMs-Firewall-Setting)
3. [Part C - Azure Cost Analysis Charts](#Part-C---Azure-Cost-Analysis-Charts)


### Part A - Creating and Configuring VMs - Using Azure CLI Scripts

- **Question1:** 

The extracted Embed details from the `Azure Bash CLI` in the Portal that provide a comprehensive list of virtual machines, network security groups `NSGs`, network interface cards `NICs`, and `disks`.
1. `az vm list --output table`

```bash
Name    ResourceGroup      Location    Zones
------  -----------------  ----------  -------
LR-18   STUDENT-RG-954177  canadaeast
LS-18   STUDENT-RG-954177  canadaeast
WC-18   STUDENT-RG-954177  canadaeast
WS-18   STUDENT-RG-954177  canadaeast
```

2. `az network nsg list --output table`
```bash
Location    Name         ProvisioningState    ResourceGroup      ResourceGuid
----------  -----------  -------------------  -----------------  ------------------------------------
canadaeast  LR-18-nsg    Succeeded            Student-RG-954177  c6cc726d-9254-4707-82cd-560bf426aa34
canadaeast  LR-NSG-18    Succeeded            Student-RG-954177  b9c75af4-9989-4ad7-862a-e2038e0853dc
canadaeast  LS-18-nsg    Succeeded            Student-RG-954177  ac9de50d-6294-44d7-9115-ae84484ae4ef
canadaeast  LS-NSG-18    Succeeded            Student-RG-954177  d18cb571-defc-4555-9bd0-00d895baa6ee
canadaeast  WC-18-nsg    Succeeded            Student-RG-954177  ffb26c0c-f316-4544-a97a-dd3bc938bce1
canadaeast  WC-NSG-18    Succeeded            Student-RG-954177  82930444-a11e-4861-ba52-3b5d3d0cc0b5
canadaeast  WS-18-nsg    Succeeded            Student-RG-954177  3298fe0d-039e-42a6-aa30-a04eaf6a943b
canadaeast  WS-NSG-18    Succeeded            Student-RG-954177  398874aa-e3ab-458c-a55d-3886573713cd
```

3. `az network nic list --output table`
```bash
EnableAcceleratedNetworking    EnableIPForwarding    Location    MacAddress         Name    NicType    Primary    ProvisioningState    ResourceGroup      ResourceGuid                          VnetEncryptionSupported
-----------------------------  --------------------  ----------  -----------------  ------  ---------  ---------  -------------------  -----------------  ------------------------------------  -------------------------
False                          True                  canadaeast  60-45-BD-F9-95-3B  lr-18   Standard   True       Succeeded            Student-RG-954177  d1677b43-791a-4800-bf6d-f7049ebea2cb  False
False                          False                 canadaeast  60-45-BD-FA-03-EE  ls-18   Standard   True       Succeeded            Student-RG-954177  546f1149-290b-4639-a6f0-73fd91fd71f0  False
False                          False                 canadaeast  60-45-BD-CD-3D-68  wc-18   Standard   True       Succeeded            Student-RG-954177  16f8e895-0dc1-409b-a68c-cf6ff84cd8c4  False
False                          False                 canadaeast  60-45-BD-F9-93-A6  ws-18   Standard   True       Succeeded            Student-RG-954177  48b3724a-6648-470e-905a-785831aab8f8  False
```

4. `az disk list --output table`
```bash
Name                                          ResourceGroup      Location    Zones    Sku              OsType    SizeGb    ProvisioningState
--------------------------------------------  -----------------  ----------  -------  ---------------  --------  --------  -------------------
LR-18_disk1_7dcf3c291f974ee5a67a0ec0bc121c1c  STUDENT-RG-954177  canadaeast           StandardSSD_LRS  Linux     64        Succeeded
LS-18_disk1_ba569456cde24e0b9599e4d748a5683a  STUDENT-RG-954177  canadaeast           StandardSSD_LRS  Linux     64        Succeeded
WC-18_disk1_44cfdc61ad7d49389bda29d86069d839  STUDENT-RG-954177  canadaeast           StandardSSD_LRS  Windows   127       Succeeded
WS-18_disk1_35ab04841c6b42c98a7e69559364582a  STUDENT-RG-954177  canadaeast           StandardSSD_LRS  Windows   127       Succeeded
```

- **Question2:**
Why are you creating NIC separate from VM? What happens when you delete a VM, is that attached NIC automatically deleted? Why?

> The reason why that the `NICs` are separate from `VMs`  in order to provide more flexibility and control over network configurations. However when we delete a `VM`, the attached NIC is not automatically deleted, also it may be used by other resources or `VMs`. for this the propre way to manage the process of deleting a `VM` and its attached `NIC`, is the first thing is to check if it is being used, so that can be safely deleted after the `VM` has been deleted. However, if the `NIC` is being used, it should be detached from the `VM` before the `VM` is deleted.

- **Question3:**
When you created `VMs` from Portal can you use an existing `NIC`? Do you consider this a limitation in working from Portal for `VM` creation?
> It is not possible to use an existing `NIC`. This can be a limitation for users who want to use a specific NIC configuration for their `VMs`. In addition, the Azure portal also has other limitations when it comes to `VM` creation. However, for users are limited in their ability to customize `VM` configurations and the features that are available in Azure.


- **Question4:**
What rules did we add to Network Security Groups (NSG)? What does each rule do?
> Allow rule: This rule allows inbound or outbound traffic such as source IP, destination IP, port number, or protocol. It permits network communication between trusted resources that we have set them in the rule.

> Deny rule: This rule blocks inbound or outbound traffic, which can deny network communication and be not able to procced to specific resources.

> Priority rule: `NSGs` have a priority order for rules. which are the numbers that have lower numbers are in order of priority than higher numbers.

- **Question5:**
The command that lists all the Custom Images is : `az image list --output table` in the output table format.
```bash
HyperVGeneration    Location    Name                          ProvisioningState    ResourceGroup
------------------  ----------  ----------------------------  -------------------  -----------------
V2                  canadaeast  lr-18-ver-0.0.1               Succeeded            STUDENT-RG-954177
V2                  canadaeast  lr-18-ver-10                  Succeeded            STUDENT-RG-954177
V2                  canadaeast  ls-18-ver-0.0.1               Succeeded            STUDENT-RG-954177
V2                  canadaeast  ls-18-ver-10                  Succeeded            STUDENT-RG-954177
V2                  canadaeast  wc-18-ver-0.0.1               Succeeded            STUDENT-RG-954177
V2                  canadaeast  wc-18-ver-10                  Succeeded            STUDENT-RG-954177
V2                  canadaeast  ws-18-ver-0.0.1               Succeeded            STUDENT-RG-954177
V2                  canadaeast  ws-18-ver-10                  Succeeded            STUDENT-RG-954177
```

- **Question6:**
After deleting `VMs` using the script and running the command that lists all your VMs `az vm list --output table` it shows an empty output which means that all VMs were deleted successfully.

[./Images/DeletedVMs.JPG](./Images/DeletedVMs.JPG)

![Deleted VMs](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/DeletedVMs.JPG)


- **Question7:**
After runing the script to delete the resources it deletes automatically includes the deletion of `Disks` and `VMs`, but the remaining components are the `NIC` and `NSG`.

1. `az network nic list --output table`
```bash
EnableAcceleratedNetworking    EnableIPForwarding    Location    MacAddress         Name    NicType    Primary    ProvisioningState    ResourceGroup      ResourceGuid                          VnetEncryptionSupported
-----------------------------  --------------------  ----------  -----------------  ------  ---------  ---------  -------------------  -----------------  ------------------------------------  -------------------------
False                          True                  canadaeast  60-45-BD-F9-95-3B  lr-18   Standard   True       Succeeded            Student-RG-954177  d1677b43-791a-4800-bf6d-f7049ebea2cb  False
False                          False                 canadaeast  60-45-BD-FA-03-EE  ls-18   Standard   True       Succeeded            Student-RG-954177  546f1149-290b-4639-a6f0-73fd91fd71f0  False
False                          False                 canadaeast  60-45-BD-CD-3D-68  wc-18   Standard   True       Succeeded            Student-RG-954177  16f8e895-0dc1-409b-a68c-cf6ff84cd8c4  False
False                          False                 canadaeast  60-45-BD-F9-93-A6  ws-18   Standard   True       Succeeded            Student-RG-954177  48b3724a-6648-470e-905a-785831aab8f8  False
 ```

2. `az network nsg list --output table`
```bash
Location    Name         ProvisioningState    ResourceGroup      ResourceGuid
----------  -----------  -------------------  -----------------  ------------------------------------
canadaeast  LR-18-nsg    Succeeded            Student-RG-954177  c6cc726d-9254-4707-82cd-560bf426aa34
canadaeast  LR-NSG-18    Succeeded            Student-RG-954177  b9c75af4-9989-4ad7-862a-e2038e0853dc
canadaeast  LS-18-nsg    Succeeded            Student-RG-954177  ac9de50d-6294-44d7-9115-ae84484ae4ef
canadaeast  LS-NSG-18    Succeeded            Student-RG-954177  d18cb571-defc-4555-9bd0-00d895baa6ee
canadaeast  WC-18-nsg    Succeeded            Student-RG-954177  ffb26c0c-f316-4544-a97a-dd3bc938bce1
canadaeast  WC-NSG-18    Succeeded            Student-RG-954177  82930444-a11e-4861-ba52-3b5d3d0cc0b5
canadaeast  WS-18-nsg    Succeeded            Student-RG-954177  3298fe0d-039e-42a6-aa30-a04eaf6a943b
canadaeast  WS-NSG-18    Succeeded            Student-RG-954177  398874aa-e3ab-458c-a55d-3886573713cd
```

### Part B - Basic Connectivity - Linux VMs Firewall Setting

- **Question1:**
The command that i used to extract the output of `Apache` server is: `systemctl status apache2`

```bash
`Unit apache2.service could not be found`
```

The command that i used to extract the output `Mariadb` server is: `systemctl status mariadb`

```bash
`Unit mariadb.service could not be found`
```
- **Question2:**
The output in `LR-18` that show iptables chains are usually empty, which can allow all incoming and outcoming traffic, while no rules are set to filter network traffic. However, the system will be vulnerable to attacks.

[./Images/Emptyiptables.JPG](./Images/Emptyiptables.JPG)

![Empty iptables](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Emptyiptables.JPG)

- **Question3:**
The command that shows the hostname in LR-18 is : `sudo hostnamectl status` or simply `hostname`

```bash
LR-18.CSN4002234.com
```
The command that shows the hostname in LS-18 is : `sudo hostnamectl status` or simply `hostname`

```bash
LS-18.CSN4002234.com
```

- **Question4:**

[./logfiles/lr_iptables.txt](./logfiles/lr_iptables.txt)

[./logfiles/ls_iptables.txt](./logfiles/ls_iptables.txt)


### Part C - Azure Cost Analysis Charts

1. [./Images/Resource1.JPG](./Images/Resource1.JPG)

![DailyCosts Resource1](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Resource1.JPG)

2. [./Images/Service.JPG](./Images/Service.JPG)

![DailyCosts Service](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Service.JPG)

3. [./Images/Resource2.JPG](./Images/Resource2.JPG)

![DailyCosts Resource2](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Resource2.JPG)

4. [./Images/ServiceName.JPG](./Images/ServiceName.JPG)

![Service Name](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/ServiceName.JPG)

5. [./Images/ServiceFamily.JPG](./Images/ServiceFamily.JPG)

![Service Family](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/ServiceFamily.JPG)

6. [./Images/Product.JPG](./Images/Product.JPG)

![Last Month Product](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Product.JPG)

7. [./Images/Dashboard.JPG](./Images/Dashboard.JPG)

![Dashboard Sample-18](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Dashboard.JPG)









