
# Cloud Native PostgreSQL Playground

## How to deploy

First you have to install all the dependencies:
```sh
helm dependency update charts/cnp-playground
helm upgrade --install cnp-playground --atomic charts/cnp-playground
```

And follow the instructions it will return once everything is installed

## Dev deployment
If you have already deployed the CNP operator or you want to use a different version, run:
```sh
helm dependency update charts/cnp-playground
helm upgrade --install cnp-playground --set cloud-native-postgresql.enabled=false --atomic charts/cnp-playground
 ```
