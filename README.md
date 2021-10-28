
# Cloud Native PostgreSQL Playground

## How to deploy

First you have to install all the dependencies:
```sh
helm dependency update charts/cnp-playground
helm install cnp-playground --atomic charts/cnp-playground
```

Then install the actual cluster and everything needed to monitor it:
```sh
helm upgrade --install --set dependenciesOnly=false charts/cnp-playground --atomic cnp-playground
```

## Dev deployment
If you have already deployed the CNP operator or you want to use a different version, run:
```sh
helm dependency update charts/cnp-playground
helm install cnp-playground --set cloud-native-postgresql.enabled=false --atomic charts/cnp-playground
 helm upgrade --install --set dependenciesOnly=false --set cloud-native-postgresql.enabled=false --atomic cnp-playground
 ```
