source ./network_config.sh
source ./vm_config.sh

nic_name=$1
vnet_name=$2
subnet_name=$3
nsg_name=$4

echo "---------------------------------------------------"
echo "Netwrok Interface Card (NIC): $nic_name"
echo "---------------------------------------------------"
echo "Check if it already exists ---"
if [[ $(az network nic list -g $RG_NAME -o tsv --query "[?name=='$nic_name']") ]]
then
    echo "exists!"
    az network nic show -g $RG_NAME --name $nic_name --query id 
else
    echo "doesn't exist!"
    echo "Do you want to create VM NIC: $nic_name? (yes/no)"
    read -r answer
    if [[ "$answer" == "yes" ]]; then

        az network nic create --name $nic_name \
            -g $RG_NAME \
            --vnet-name $vnet_name \
            --subnet $subnet_name \
            --network-security-group $nsg_name 
            # --public-ip-address ""

        echo "NIC Created!"
        echo "NIC List"
        az network nic list -g $RG_NAME --out table
    fi
fi
