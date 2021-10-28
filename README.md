
# Cloud Native PostgreSQL Playground

## How to deploy

First you have to install all the dependencies:
```sh
helm dependency update cnp-playground
helm install cnp-playground --atomic cnp-playground
```

Then install the actual cluster and everything needed to monitor it:
```sh
helm upgrade --install --set dependenciesOnly=false cnp-playground --atomic cnp-playground
```
