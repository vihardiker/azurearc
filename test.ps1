#############################################################
# 1. Register necessary resource providers and add extensions
# 2. Check and Create RG (if necessary)
# 3. Check and Connect to cluster
# 4. Enable Cluster for Azure ARC
# 5. Create Custom Location
# 6. Create Data Controller
#############################################################

# Parameters
$RESOURCEGROUPNAME = $Env:resourceGroupName
$DataControllerName = $Env:datacontrollername
$adConnectorname = $Env:adconnectorname
$sqlManagedInstanceName = $Env:sqlManagedInstanceName
$sqlAccountName = $Env:sqlAccountName
$PortNumber = $Env:PortNumber
$AZDATA_USERNAME = $Env:AZDATA_USERNAME
$AZDATA_PASSWORD = $Env:AZDATA_PASSWORD
$ACCEPT_EULA = $Env:ACCEPT_EULA
$LOCATION = $Env:location
$CLUSTERNAME = $Env:CLUSTERNAME
$CLNAME = $Env:CLNAME
$NAMESPACE = $Env:namespace
$PROFILENAME = $Env:profilename
$CONNECTIVITYMODE = $Env:connectivitymode      #direct
$AUTOUPLOADMETRICS = $Env:autouploadmetrics    #true
$STORAGECLASS = $Env:storageclass              #longhorn

Write-Output "ResourceGroupName: " $RESOURCEGROUPNAME
Write-Output "Location: " $LOCATION

