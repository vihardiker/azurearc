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