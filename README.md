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
|`AZURE_SUBSCRIPTION_ID`|`Azure Subscription ID used to deploy resources`|`xxxx, or other possible values`|


 <span style="color:red"><u>DO NOT CHANGE THE VALUE OF SPNID ABOVE</u></span>

## <u>Secrets</u>

Github allows to use secrets in a pipeline workflow. The secrets are username, password, service principal etc. Here are the details of the secrets used in the pipeline workflow:

## <span style="color:red"><u>Important Note</u></span>

Keep a note of the secrets, once they are saved in github, you can only update it, however, cannot retrieve the value.

|Secret Name|Description|Typical Values|
|:--|:--|:--|
|`ARC_SP_CLIENT_ID`|`Client ID of the Service Principal`|`This is an auto generated value`|
|`ARC_SP_CLIENT_SECRET`|`Client Secret of the Service Principal`|`This is an auto generated value`|
|`ARC_SP_TENANT_ID`|`Tenant ID`|`This is an auto generated value`|
|`AZDATA_USERNAME`|`Username to log into Logs and Metrics Dashborad`|`sqlmiadmin, or other possible value`|
|`AZDATA_PASSWORD`|`Password to log into Logs and Metrics Dashborad`|`@@Password123@, or other possible value`|


## <u>Additional resources</u>

- [Enable custom locations on your cluster](https://learn.microsoft.com/en-us/azure/azure-arc/kubernetes/custom-locations#enable-custom-locations-on-your-cluster)
- [Github Action Secrets](https://docs.github.com/en/rest/actions/secrets?apiVersion=2022-11-28#get-an-organization-secret)
