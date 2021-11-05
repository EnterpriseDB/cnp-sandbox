# cnp-sandbox

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A sandbox for Cloud Native PostgreSQL

**Homepage:** <https://www.enterprisedb.com/products/postgresql-on-kubernetes-ha-clusters-k8s-containers-scalable>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| phisco | philippe.scorsolini@enterprisedb.com |  |

## Source Code

* <https://github.com/EnterpriseDB/cnp-sandbox>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://enterprisedb.github.io/cloud-native-postgresql-helm/ | cloud-native-postgresql | 0.7.2 |
| https://prometheus-community.github.io/helm-charts | kube-prometheus-stack | 19.2.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cloud-native-postgresql | object | `{"enabled":true}` | here you can pass the whole values directly to the cloud-native-postgresql chart |
| kube-prometheus-stack | object | `{"alertmanager":{"enabled":false},"enabled":true,"grafana":{"adminPassword":"prom-operator","enabled":true},"prometheus":{"prometheusSpec":{"podMonitorSelectorNilUsesHelmValues":false,"probeSelectorNilUsesHelmValues":false,"ruleSelectorNilUsesHelmValues":false,"serviceMonitorSelectorNilUsesHelmValues":false}}}` | here you can pass the whole values directly to the kube-prometheus-stack chart |
| kube-prometheus-stack.grafana.adminPassword | string | `"prom-operator"` | the grafana admin password |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)