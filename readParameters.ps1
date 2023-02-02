
# Read the JSON file
$myfile = cat .\globalparameters.json | convertfrom-json


# Parse through the JSON file and assign arguments the values provided in the file
foreach ($obj in $myfile.PSObject.Properties) {
   
    if($obj.Name -eq "resourceGroup") { $resourceGroup = $obj.value}
    if($obj.Name -eq "dataControllername") { $dataControllername = $obj.value}
    if($obj.Name -eq "adConnectorname") { $adConnectorname = $obj.value}
    if($obj.Name -eq "sqlManagedInstanceName") { $sqlManagedInstanceName = $obj.value}
    if($obj.Name -eq "sqlAccountName") { $sqlAccountName = $obj.value}
    if($obj.Name -eq "PortNumber") { $PortNumber = $obj.value}
    if($obj.Name -eq "CustomLocationName") { $CustomLocationName = $obj.value}
    if($obj.Name -eq "AZDATA_USERNAME") { $AZDATA_USERNAME = $obj.value}
    if($obj.Name -eq "AZDATA_PASSWORD") { $AZDATA_PASSWORD = $obj.value}
    if($obj.Name -eq "ACCEPT_EULA") { $ACCEPT_EULA = $obj.value}
}

Write-Host " "
Write-Host " "
Write-Host " "

# Displaying the arguments
Write-Host 
Write-Host "resourceGroup: $resourceGroup";
Write-Host "dataControllername: $dataControllername";
Write-Host "adConnectorname: $adConnectorname";
Write-Host "sqlManagedInstanceName: $sqlManagedInstanceName";
Write-Host "sqlAccountName: $sqlAccountName";
Write-Host "PortNumber: $PortNumber";
Write-Host "CustomLocationName: $CustomLocationName";
Write-Host "AZDATA_USERNAME: $AZDATA_USERNAME";
Write-Host "AZDATA_PASSWORD: $AZDATA_PASSWORD";
Write-Host "ACCEPT_EULA: $ACCEPT_EULA";

Write-Host "These are the outputs"

Write-Output "resourceGroup: $resourceGroup";
Write-Output "dataControllername: $dataControllername";
Write-Output "adConnectorname: $adConnectorname";
Write-Output "sqlManagedInstanceName: $sqlManagedInstanceName";
Write-Output "sqlAccountName: $sqlAccountName";
Write-Output "PortNumber: $PortNumber";
Write-Output "CustomLocationName: $CustomLocationName";
Write-Output "AZDATA_USERNAME: $AZDATA_USERNAME";
Write-Output "AZDATA_PASSWORD: $AZDATA_PASSWORD";
Write-Output "ACCEPT_EULA: $ACCEPT_EULA";