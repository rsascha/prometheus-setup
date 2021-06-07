# Kubernetes Prometheus Setup

This repository provides functionallity to install Prometheus into a Kubernetes Cluster.

Please see: https://github.com/prometheus-community/helm-charts

## My System

- [Docker Desktop](https://www.docker.com/products/docker-desktop) Version 3.3.3
- macOS Big Sur 11.3.1

## Setup

First you need to add some helm repositories ...

`make setup`

## Install

Install the Prometheus stack into your K8s cluster:

`make install`

After that, check: `watch -n1 kubectl -n prometheus get pods`

Try to access Grafana: grafana-127-0-0-1.nip.io

```plain
User:       admin
Password:   nimda
```

## Upgrade

Upgrade or just re-apply changes of `values.yaml`:

`make upgrade`

## Uninstall

`make uninstall`
