# Percona Helm Charts

This repository contains Helm charts for various Percona products.

* [Percona XtraDB Cluster Operator](pxc-operator/README.md)
* [Percona XtraDB Cluster](pxc-database/README.md)

## Installing Charts from this Repository

Add the Repository to Helm:

```bash
helm repo add percona https://tech.paulcz.net/percona-helm-charts
```

Install Percona Operator:

```bash
helm install percona/pxc-operator
```

Install Percona Cluster:

```bash
helm install percona/pxc-database
```
