# AZUREARC Repository


# <u>Codebase in this repository will register required providers, add necessary extensions, check and create(if necessary) a Resource Group, Check and connect to an existing cluster, enable cluster for Azure Arc, create a custom location, and create a Data Controller </u>




## <u>Parameters or Arguments</u>

|Parameter Name|Description|Typical Values|
|:--|:--|:--|
|`RESOURCEGROUPNAME`|`Name of the Resource Group`|`rg-vh-akslab2, or other values`|
|`DATACONTROLLERNAME`|`Data Controller name`|`akslab2dc, or other values`|
|`CLUSTEREXISTS`|`A flag to determine if a Kubernetes Cluster exists or not`|`true or false`|
|`LOCATION`|`Location of the resources`|`southcentralus, or other regions where Azure Arc is available`|
|`CLUSTERNAME`|`Name of the existing Kubernetes Cluster Name`|`akslab2, or other possible values`|
|`CLNAME`|`Custom Location name`|`labcusloc, or other possible values`|
|`NAMESPACE`|`Specify the namespace to install the extension release`|`myarcns, or other possible values`|
|`CONNECTIVITYMODE`|`The connectivity to Azure - indirect or direct - which the data controller should operate in`|`direct or indirect`|
|`AUTOUPLOADMETRICS`|`Enable auto upload metrics.`|`true or false`|
|`AUTOUPLOADLOGS`|`Enable auto upload logs`|`true or false`|
|`PROFILENAME`|`The name of an existing configuration profile. Run az arcdata dc config list to see available options`|`'azure-arc-ake', 'azure-arc-aks-default-storage', 'azure-arc-aks-hci', 'azure-arc-aks-premium-storage', 'azure-arc-azure-openshift', 'azure-arc-eks', 'azure-arc-gke', 'azure-arc-kubeadm', 'azure-arc-openshift', 'azure-arc-unit-test'`|
|`STORAGECLASS`|`The storage class to be used for all data and logs persistent volumes for all data controller pods that require them.`|`managed-premium, or other possible values`|
|`ADSEXTENSIONNAME`|`Name of the extension instance`|`vhadsext, or other possible values`|
|`SPNID`|`OID of 'custom-locations' app`|`e14b073a-ef29-47af-9386-29ad771ed6e8, this is the id for JD Tenant`|

<u>DO NOT CHANGE THE VALUE OF SPNID ABOVE</u>


## <u>Additional resources</u>

- [Enable custom locations on your cluster](https://learn.microsoft.com/en-us/azure/azure-arc/kubernetes/custom-locations#enable-custom-locations-on-your-cluster)
