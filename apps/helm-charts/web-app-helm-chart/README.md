# README.md

# Web App Helm Chart

This Helm chart deploys a web application along with its associated resources, including a Deployment, Service, Horizontal Pod Autoscaler (HPA), and a ConfigMap for StatsD mapping configuration.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.x

## Installation

To install the chart, use the following command:

```bash
helm install <release-name> ./web-app-helm-chart
```

Replace `<release-name>` with your desired name for the release.

## Configuration

The following table lists the configurable parameters of the chart and their default values:

| Parameter                          | Description                                         | Default                |
|------------------------------------|-----------------------------------------------------|------------------------|
| `image.repository`                 | Image repository for the web app                   | `pschnurbus24/web-app` |
| `image.tag`                        | Image tag for the web app                          | `0.4`                  |
| `replicaCount`                     | Number of replicas for the Deployment               | `1`                    |
| `resources.requests.cpu`           | CPU request for the web app container               | `200m`                 |
| `resources.limits.cpu`             | CPU limit for the web app container                 | `400m`                 |
| `resources.requests.memory`         | Memory request for the web app container            | `256Mi`                |
| `resources.limits.memory`           | Memory limit for the web app container              | `512Mi`                |
| `hpa.minReplicas`                  | Minimum replicas for the HPA                        | `1`                    |
| `hpa.maxReplicas`                  | Maximum replicas for the HPA                        | `10`                   |
| `service.type`                     | Service type                                       | `ClusterIP`            |
| `service.port`                     | Service port                                       | `8080`                 |
| `service.metricsPort`              | Metrics service port                                | `9102`                 |

## Upgrade

To upgrade the chart, use the following command:

```bash
helm upgrade <release-name> ./web-app-helm-chart
```

## Uninstalling the Chart

To uninstall the chart, use the following command:

```bash
helm uninstall <release-name>
```

## Contributing

Feel free to submit issues and pull requests for improvements or bug fixes.