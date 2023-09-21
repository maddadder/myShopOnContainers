# Kubernetes deployment

This folder contains the files required to deploy eShopOnContainers to a Kubernetes cluster.

For more information see the following articles in the [wiki](https://github.com/dotnet-architecture/eShopOnContainers/wiki):

- [Deploy to Local Kubernetes](https://github.com/dotnet-architecture/eShopOnContainers/wiki/Deploy-to-Local-Kubernetes)
- [Deploy to Azure Kubernetes Service (AKS)](https://github.com/dotnet-architecture/eShopOnContainers/wiki/Deploy-to-Azure-Kubernetes-Service-(AKS))

## Deploy to Local Kubernetes using istio
```powershell

cd helm
.\deploy-all-mac.ps1 -imageTag "linux-1.0.119" -useLocalk8s $true -microk8s $true -registry "master-0.local:32000" -dockerUser "bla" -dockerPassword "bla" -namespace "eshop"

```