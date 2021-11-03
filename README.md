# Cloud Native PostgreSQL Playground

## Introduction

Cloud Native PostgreSQL Playground is a helm chart that aims to easily set up a CNP(Cloud Native PostgresSQL) environment, 
made by:  
- CNP operator bundled with a set of monitoring queries and the relative PodMonitoring.
- Prometheus
- Grafana with a custom CNP Dashboard for the relative monitoring queries.

## Requirements

- make 3.8
- helm 3.7
- kubernetes cluster with the relative RBAC permissions needed to deploy the resources.

## Deployment

Depending on the setup type the following command:
- Standard Deployment: `make playground-deploy`
- Developer deployment: `make playground-deploy-dev`

Follow the instructions that will appear on the terminal once the installation is completed.

## Monitoring

In grafana you can find the dashboard by clicking on: `Dashboards > Manage > Cloud Native PostgresSQL`

