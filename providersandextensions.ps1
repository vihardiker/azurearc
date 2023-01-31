# Login to Azure using Service Principal credentials from Github Secrets
Write-Output "Logging in to Azure with a service principal..."
az login --service-principal --username $Env:ARC_SP_CLIENT_ID --password $Env:ARC_SP_CLIENT_SECRET --tenant $Env:ARC_SP_TENANT_ID
Write-Output "Done logging into Azure"

# Select Azure subscription
az account set --subscription $Env:ARC_AZURE_SUBSCRIPTION_ID

# Get az version
az --version 

# Register the Arc resource providers
  az provider register --namespace Microsoft.Kubernetes
  az provider register --namespace Microsoft.KubernetesConfiguration
  az provider register --namespace Microsoft.ExtendedLocation
#  Install the az CLI extensions
  az extension add --name k8s-extension
  az extension add --name connectedk8s
  az extension add --name k8s-configuration
  az extension add --name customlocation
  az extension add --name arcdata