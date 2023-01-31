# Parameters
$RESOURCEGROUPNAME = "rg-aks-lab1"
$LOCATION = "eastus"

# Login to Azure using Service Principal credentials from Github Secrets
Write-Output "Logging in to Azure with a service principal..."
az login --service-principal --username $Env:ARC_SP_CLIENT_ID --password $Env:ARC_SP_CLIENT_SECRET --tenant $Env:ARC_SP_TENANT_ID
Write-Output "Done logging into Azure"

# Select Azure subscription
Write-Output "Setting Azure Subscription"
az account set --subscription $Env:ARC_AZURE_SUBSCRIPTION_ID
Write-Output "Done Setting Azure Subscription"

# Get az version
Write-Output "Checking Az Version"
az --version 
Write-Output "Done Checking Az Version"

# Register the Arc resource providers
Write-Output "Registering Providers"
  az provider register --namespace Microsoft.Kubernetes
  az provider register --namespace Microsoft.KubernetesConfiguration
  az provider register --namespace Microsoft.ExtendedLocation
Write-Output "Done Registering Providers"

#  Install the az CLI extensions
Write-Output "Adding Extensions"
  az extension add --name k8s-extension
  az extension add --name connectedk8s
  az extension add --name k8s-configuration
  az extension add --name customlocation
  az extension add --name arcdata
Write-Output "Done Adding Extensions"

# Check to see if the Resource Group exists or not. If it does not exist create one
Write-Output "Checking for RG"
$rsgExists = az group exists --name $RESOURCEGROUPNAME
if ($rsgExists -eq 'false') {
    az group create --name $RESOURCEGROUPNAME --location $LOCATION
}
Write-Output "Done Checking for and creating RG"
