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
Write-Output "DataControllerName: " $DataControllerName
Write-Output "adConnectorname: " $adConnectorname
Write-Output "sqlManagedInstanceName: " $sqlManagedInstanceName
Write-Output "sqlAccountName: " $sqlAccountName
Write-Output "PortNumber: " $PortNumber
Write-Output "AZDATA_USERNAME: " $AZDATA_USERNAME
Write-Output "AZDATA_PASSWORD: " $AZDATA_PASSWORD
Write-Output "ACCEPT_EULA: " $ACCEPT_EULA
Write-Output "Location: " $LOCATION
Write-Output "CLUSTERNAME: " $CLUSTERNAME
Write-Output "CLNAME: " $CLNAME
Write-Output "NAMESPACE: " $NAMESPACE
Write-Output "PROFILENAME: " $PROFILENAME
Write-Output "CONNECTIVITYMODE: " $CONNECTIVITYMODE
Write-Output "AUTOUPLOADMETRICS: " $AUTOUPLOADMETRICS
Write-Output "STORAGECLASS: " $STORAGECLASS