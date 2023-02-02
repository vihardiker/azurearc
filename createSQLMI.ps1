###############
# Create SQL MI
###############

# Parameters
$RESOURCEGROUPNAME = $Env:resourceGroup
$SQLMINAME = $Env:sqlminame
$ADCONNECTORNAME = $Env:adconnectorname
$SQLACCOUNTNAME = $Env:sqlaccountname
$PRIMARYDNSNAME = $Env:primarydnsname
$PORTNUMBER = $Env:portnumber
$ISTHISADEVINSTANCE = $Env:isthisadevinstance                #true or false, true means dev instance
$CLNAME = $Env:CLNAME



########################################################################
# Login to Azure using Service Principal credentials from Github Secrets
########################################################################
Write-Output "Logging in to Azure with a service principal..."
az login --service-principal --username $Env:ARC_SP_CLIENT_ID --password $Env:ARC_SP_CLIENT_SECRET --tenant $Env:ARC_SP_TENANT_ID
Write-Output "Done logging into Azure"

###########################
# Select Azure subscription
###########################
Write-Output "Setting Azure Subscription"
az account set --subscription $Env:ARC_AZURE_SUBSCRIPTION_ID
Write-Output "Done Setting Azure Subscription"


#################################
# Create SQL Managed Instance(MI)
#################################
Write-Output "Create SQL MI"
az config set extension.use_dynamic_install=yes_without_prompt
# Is this a dev instance of SQL MI
if ($ISTHISADEVINSTANCE -eq 'true') {
    az sql mi-arc create --name $SQLMINAME --ad-connector-name $ADCONNECTORNAME --ad-account-name $SQLACCOUNTNAME --primary-dns-name $PRIMARYDNSNAME --primary-port-number $PORTNUMBER --custom-location $CLNAME --resource-group $RESOURCEGROUPNAME --dev
}
else {
    az sql mi-arc create --name $SQLMINAME --ad-connector-name $ADCONNECTORNAME --ad-account-name $SQLACCOUNTNAME --primary-dns-name $PRIMARYDNSNAME --primary-port-number $PORTNUMBER --custom-location $CLNAME --resource-group $RESOURCEGROUPNAME
}
Write-Output "Done Creating SQL MI"


###################################
# Get details of the created SQL MI
###################################
Write-Output "Details of the newly created SQL MI"
az sql mi show --name $SQLMINAME --resource-group $RESOURCEGROUPNAME
Write-Output "Done displaying the details of the newly created SQL MI"

