# Helm Repository

## WARNING!!!
**Anything you put in this repo will be publicly available, so, don't put any tokens or secrets in this repo.**


This repositry has a workflow setup which will publish all the charts in the `charts` folder of this repo to Github Pages as a helm repo.

You can verify the published contents by going to https://tuned.github.io/helm-repo/index.yaml

## Local Development

#### **Add helm repo**
`helm repo add tuned-repo https://tuned.github.io/helm-repo`

#### **List all helm repos**
`helm repo list`

#### **Pull latest**
`helm repo update tuned-repo`