#############################################################
# 1. Register necessary resource providers and add extensions
# 2. Check and Create RG (if necessary)
# 3. Check and Connect to cluster
# 4. Enable Cluster for Azure ARC
# 5. Create Custom Location
# 6. Create Data Controller
#############################################################

# Parameters
$RESOURCEGROUPNAME = $Env:resourceGroup
$LOCATION = $Env:location
$CLUSTEREXISTS = true
$CLUSTERNAME = $Env:CLUSTERNAME
$CLNAME = $Env:CLNAME
$NAMESPACE = $Env:namespace
$DataControllerName = $Env:datacontrollername
$PROFILENAME = $Env:profilename
$CONNECTIVITYMODE = $Env:connectivitymode      #direct
$AUTOUPLOADMETRICS = $Env:autouploadmetrics    #true
$STORAGECLASS = $Env:storageclass              #longhorn

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

################
# Get az version
################
Write-Output "Checking Az Version"
az --version 
Write-Output "Done Checking Az Version"

#####################################
# Register the Arc resource providers
#####################################
Write-Output "Registering Providers"
  az provider register --namespace Microsoft.Kubernetes
  az provider register --namespace Microsoft.KubernetesConfiguration
  az provider register --namespace Microsoft.ExtendedLocation
Write-Output "Done Registering Providers"

################################
#  Install the az CLI extensions
################################
Write-Output "Adding Extensions"
  az extension add --name k8s-extension
  az extension add --name connectedk8s
  az extension add --name k8s-configuration
  az extension add --name customlocation
  az extension add --name arcdata
Write-Output "Done Adding Extensions"

###################################################################################
# Check to see if the Resource Group exists or not. If it does not exist create one
###################################################################################
Write-Output "Checking for RG"
$rsgExists = az group exists --name $RESOURCEGROUPNAME
if ($rsgExists -eq 'false') {
    az group create --name $RESOURCEGROUPNAME --location $LOCATION
}
Write-Output "Done Checking for and creating RG"

#########################################################
# Once a new cluster is available, connect to the cluster
#########################################################
Write-Output "Connecting to cluster"
if ($CLUSTEREXISTS -eq 'true') {
    az aks get-credentials --resource-group $RESOURCEGROUPNAME --name $CLUSTERNAME
}
Write-Output "Done Connecting to cluster"

#######################################
# ARC Services - Enable Cluster for ARC
#######################################
Write-Output "Enable cluster for ARC"
az connectedk8s connect --resource-group $RESOURCEGROUPNAME --name $CLUSTERNAME
Write-Output "Done Enabling cluster for ARC"

########################
# Create Custom Location
########################
Write-Output "Create Custom Location"
$ENV:hostClusterId=(az connectedk8s show --resource-group $RESOURCEGROUPNAME --name $CLUSTERNAME --query id -o tsv)
$ENV:extensionId=(az k8s-extension show --resource-group $RESOURCEGROUPNAME --cluster-name $CLUSTERNAME --cluster-type connectedClusters --name $adsExtensionName --query id -o tsv)
az customlocation create --resource-group $RESOURCEGROUPNAME --name $CLNAME --namespace $NAMESPACE --host-resource-id $ENV:hostClusterId --cluster-extension-ids $ENV:extensionId
Write-Output "Done Creating Custom Location"

########################
# Create Data Controller
########################
Write-Output "Create Data Controller"
az arcdata dc create --name $DataControllerName --resource-group $RESOURCEGROUPNAME --location $LOCATION --connectivity-mode $CONNECTIVITYMODE --profile-name $PROFILENAME --auto-upload-metrics $AUTOUPLOADMETRICS --custom-location $CLNAME --storage-class $STORAGECLASS 
Write-Output "Done Creating Data Controller"

