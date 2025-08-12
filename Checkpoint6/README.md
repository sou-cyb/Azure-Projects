# Checkpoint6 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Soufiane Berni**
- **STUDENT'S NUMBER: 108170218**
- **GITHUB USER ID: 108170218-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents
1. [Part A - Creating Network Resources using Azure CLI](#Part-A---Creating-Network-Resources-using-Azure-CLI)
2. [Part B - Working in Azure CLI Bash](#Part-B---Working-in-Azure-CLI-Bash)
3. [Part C - Network Review Questions](#Part-C---Network-Review-Questions)
4. [Part D - Creating Virtual Machines](#Part-D---Creating-Virtual-Machines)

### Part A - Creating Network Resources using Azure CLI
All the lines that I have updated in Network Configuration file [./bash-scripts/network_config.sh](./bash-scripts/network_config.sh)

```bash
RG_NAME="Student-RG-954177"                           # your student group
LOCATION="canadaeast"                                        # your location
ID="18"                                                                    #unique ID assigned to you

Student_vnet_name="Student-954177-vnet"
Student_vnet_address="10.9.215.0/24"
Client_Subnet_name="Virtual-Desktop-Client"
Client_Subnet_address="10.9.215.0/24"
```

- **Question1:** 
what does `if [[ ! $(az group list -o tsv --query "[?name=='$RG_NAME']") ]]` do?
- `[[ ! .........]]`: syntax to check the results
- `az group list`: lists all the resources groups that are in azure
- `-o tsv`: stands for `tab-separated values`, which deliver the ouput with values separated by tabs
- `--query "[?name=='$RG_NAME']"`: the main role is to filter the results of resource group name.

- **Question2:**
Why is it crucial to check if a resource exists before creating it, and what `bash syntax` do you use to test this? Furthermore, how do you check if a virtual network `vnet` exists in the `vnet_create.sh script`? 
To check if the resources exists before creating again to avoid conflicts and duplication. However, the `bash syntax` used to test the existence of the resources is `if`, with `-f` option to check if the file exists:

```bash
if [[ $(az network vnet list -g $RG_NAME -o tsv --query "[?name=='$vnet']") ]]
then
    echo "VNet exists"
else
    echo "VNet does not exist"
fi
```

- **Question3:**
What is the Azure CLI command to create vnet? Give the specific command as per your environment and unique ID configuration. What are the required and what are the optional parameters that you need to pass to it?

```bash
az network vnet create \
    --resource-group Student-RG-954177 \
    --name Student-954177-vnet \
    --location canadaeast \
    --address-prefixes 172.17.18.32/24 \
    --subnet-name SN1 \
    --subnet-prefixes 172.17.18.32/27 \
```
- **Question4:**
What is the Azure CLI command to create subnet? Give the specific command as per your environment and unique ID configuration. What are the required and what are the optional parameters that you need to pass to it?

```bash
az network vnet subnet create \
    --resource-group Student-RG-954177 \
    --vnet-name Student-954177-vnet \
    --name SN1 \
    --address-prefixes 172.17.18.32/24
```

### Part B - Working in Azure CLI Bash

1. To obtain the specified output, I have utilized the following command `az network vnet list --output json > vnet_list.json` to enumerate all the VNETs.[./jsonfiles/vnet_list.json](./jsonfiles/vnet_list.json)

2. To retrieve the output in JSON format, I utilized the following details: `az network vnet show --name Student-954177-vnet --resource-group Student-RG-954177 --output json > student_vnet.json`. [./jsonfiles/student_vnet.json](./jsonfiles/student_vnet.json)

3. The command to retrieve a list of all peerings, and the output in table format to a file. `az network vnet peering list --output table > peerings.tbl`: [./tbl/peerings.tbl](./tblfiles/peerings.tbl)

4. To obtain the details of both `Router-18` and `SN1`, we use the following command: `az network vnet subnet show --name SN1 --vnet-name Router-18 --resource-group Student-RG-954177 --query '{Subnet: subnet, RouteAssociations: routeAssociations}' --output json`

```json
{
  "routes": null,
  "subnet": {
    "addressPrefix": "192.168.18.32/27",
    "id": "/subscriptions/bd627181-5ddb-4bb6-b03f-5297c3be4e1e/resourceGroups/Student-RG-954177/providers/Microsoft.Network/virtualNetworks/Router-18/subnets/SN1"
  }
}
```
5. To list all routes in `RT-18`, i used the following commad `az network route-table route list --resource-group Student-RG-954177 --route-table-name RT-18 --output table > route_list.tbl` [./tblfiles/route_list.tbl](./tblfiles/route_list.tbl)

6. To get the details of route between the `Router-18 SN1` and `Server-18 SN1`, I have used this commad `az network route-table route show --name Route-to-Server --name ServertoRouter --resource-group Student-RG-954177 --route-table-name RT-18 --output json > route_details.json` [./jsonfiles/route_details.json](./jsonfiles/route_details.json)

7. The `CLI` command that will show which subnet is associated to which route in route table is `az network vnet subnet show --resource-group Student-RG-954177 --vnet-name Student-954177-vnet --name 'SN*' --output json`


### Part C - Network Review Questions
- **Question1:**
What is Azure Virtual Network (VNET)?
> The `VNET` it's a network service that was provided by Microsoft Azure, which can provide private `IP address space` to the resources and determine such as `subnets`, `Routing Tables`, `Security Groups`. However, it makes the connectivity to on-premises networks easier . 
- **Question2:**
How on-premises computers can access resources inside Azure virtual network?
> It can be done with a different ways such as VPN gateway which can allow a safe connection and transfer data between networks, also Azure Bastion can provide a Secure Shell `SSH` access to VMs through `Azure portal`, and using Remote Desktop Protocol `RDP` that can be connected without requiring public `IP Address` or `VPN`, besides that we can use Azure Private Link which has the capability to establish a private network connection and access to Azure services including `Storage` or `SQL Database`.

- **Question3:**
What are the most important benefits of Azure Virtual Networks?
> The most important benefits of Azure Virtual Networks they can be listed as: Network Security Groups `NSGs` and `Azure` firewall to control outbound and inbound traffic, also Subnetting and Routing allow to define subnets and build routing tables to manage network traffic. Moreover, we can assign private `IP adresses` to the resources within network. In addition, keeping the resources in the same `VNET` and enhanced scalability which can help us to add and remove resources easly.    
- **Question4:**
What is the difference between Network Security Group (NSG) and Route-Tables?
> NSGs are used to control inbound and outbound network traffic within a subnets, which they can act as a virtual firewalls and allow to determine network security rules which they can permit or deny traffic by changing the source IP address, destination, and port number that can be allow or block the traffic through. On the other hand, we have the Route Table which define the traffic that can be controlled between the subnets and the internet, and for the routing is by specifiying the `IP addresses` and next `hop destination`.

- **Question5:**
What is the difference between NSG and Firewalls?
> The difference that we can list in here is that Network Security Groups (NSGs) are used to control network traffic at the subnet. which can allow the inbound and outbound security rules such as Ports, IP addresses. where the Firewalls in Azure they provide a network security management and security features like network traffic inspection, threat intelligence integration which the service of the firewall as a built-in high availability.
- **Question6:**
What is a hob-and-spoc network topology and how be deployed in Azure Cloud?
> A hob-and-spoc(spoke) network topology is a networking architecture, and that `hub` is connected to multiple spokes, act as transit hub, and enabling communication between spoke network, which spokes are representing different network regions. Also, are `VNETs` that peer with the `hub`. However, the deployment in azure would create a Virtual Network Gateway `VPN` or `ExpressRoute` in hub. And spoke will be using `VNET` peering and communicating with the hub network.

- **Question7:**
In working with Azure VNETs, do you need to define gateways for Azure to route traffic between subnets?
> In this case we do not have to define gateways for Azure to route traffic between subnets, because Azure will automatically provide a route traffic between VNETs, which means no need any gateways on the top of that.

- **Question8:**
When do you need to configure and use Virtual Network Gateways?
> It can be used to connect to a `VNET` in a different region and been configured by using a private or public `IP Address` which they are responsible for providing a secure connection between Azure and other network.  

### Part D - Creating Virtual Machines

1. The list of all VMs i used the following comand and send all the output to a file: `az vm list --output table > vm_list.tbl`. [./tblfiles/vm_list.tbl](./tblfiles/vm_list.tbl)

2. To get the details of the `WC-18` and send the output to `json` format i have use the following command: `az vm show --name WC-18 --resource-group Student-RG-954177 --output json > WC-18-details.json`. [./jsonfiles/WC-18-details.json](./jsonfiles/WC-18-details.json)


3. The command to list `NSG` and send the output in table format, i have used this command `az network nsg list --output table > nsg_list.tbl`. [./tblfiles/nsg_list.tbl](./tblfiles/nsg_list.tbl)

4. To obtain a list of all currently running virtual machines (VMs), execute the command `az vm list --output table`. And to ensure that all VMs are deleted, we can run the `delete_all_vm.sh` file. And after executing the deletion script and running `az vm list --output table` again, the output will only display an empty array `[]`.

[./Images/Deletedvms.jpg](./Images/Deletedvms.jpg)

![Deleted vms](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint6/Images/Deletedvms.jpg)

5. The command to use to show the _auto shutdown_ of `LS-18` is `az vm show --resource-group Student-RG-954177 --name LS_18 --query 'autoShutdownSchedule'`

[./Images/LS18autoshutdown.JPG](./Images/LS18autoshutdown.JPG)

![LS_18 auto shutdown](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint6/Images/LS18autoshutdown.JPG)







