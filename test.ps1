#############################################################
# 1. Register necessary resource providers and add extensions
# 2. Check and Create RG (if necessary)
# 3. Check and Connect to cluster
# 4. Enable Cluster for Azure ARC
# 5. Create Custom Location
# 6. Create Data Controller
#############################################################

# Parameters
$RESOURCEGROUPNAME = $Env:RESOURCEGROUPNAME
$DATACONTROLLERNAME = $Env:DATACONTROLLERNAME
$CLUSTEREXISTS = $Env:CLUSTEREXISTS            #true
$LOCATION = $Env:LOCATION
$CLUSTERNAME = $Env:CLUSTERNAME
$CLNAME = $Env:CLNAME
$NAMESPACE = $Env:NAMESPACE                    #should be lowercase less than 63 alpha numeric characters
$CONNECTIVITYMODE = $Env:CONNECTIVITYMODE      #direct
$AUTOUPLOADMETRICS = $Env:AUTOUPLOADMETRICS    #false
$AUTOUPLOADLOGS = $Env:AUTOUPLOADLOGS          #false
$STORAGECLASS = $Env:STORAGECLASS              #
$ADSEXTENSIONNAME = $Env:ADSEXTENSIONNAME
$SPNID = $Env:SPNID

Write-Output "ResourceGroupName: " $RESOURCEGROUPNAME
Write-Output "DataControllerName: " $DATACONTROLLERNAME
Write-Output "CLUSTEREXISTS: " $CLUSTEREXISTS
Write-Output "Location: " $LOCATION
Write-Output "CLUSTERNAME: " $CLUSTERNAME
Write-Output "CLNAME: " $CLNAME
Write-Output "NAMESPACE: " $NAMESPACE
Write-Output "CONNECTIVITYMODE: " $CONNECTIVITYMODE
Write-Output "AUTOUPLOADMETRICS: " $AUTOUPLOADMETRICS
Write-Output "AUTOUPLOADLOGS: " $AUTOUPLOADLOGS
Write-Output "STORAGECLASS: " $STORAGECLASS
Write-Output "ADSEXTENSIONNAME: " $ADSEXTENSIONNAME
Write-Output "SPNID: " $SPNID