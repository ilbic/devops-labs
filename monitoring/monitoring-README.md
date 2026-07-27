### Solution

This project documents the process of designing (on the fly) and deploying a "production" style monitoring stack for my actual website. 

[Diagram](./diagram.md)

#### Key objectives

As stated in the [scope](https://roadmap.sh/projects/monitoring):

- Monitor host system health
- Monitor external service availability
- Monitor NGINX performance
- Visualise metrics in Grafana
- Get experience with PromQL and observability tooling more broadly

#### The Stack

- Containerised deployment
 - Fully replicatable, configured to be resilient to a reboot/outage
- Nginx, Node, Blackbox scrape jobs setup for ingress into Prometheus
- Seven day retention policy
- Persistent storage using Docker volumes

#### Node Exporter

Collects host metrics including:

- CPU utilisation
- Memory usage
- Disk utilisation
- Filesystem statistics
- Network throughput

#### Blackbox Exporter

Configured to monitor:

- Website availability
- HTTP response times
- TLS certificate expiry

#### NGINX Exporter

Configured using NGINX `stub_status` to expose:

- Active connections
- Reading/Writing/Waiting connections
- Request metrics

---

#### Grafana

Configured Grafana as a Prometheus data source and built dashboards using PromQL.

Example dashboards include:

- CPU utilisation
- Memory utilisation
- Disk utilisation
- Website availability
- HTTP response time
- SSL certificate expiry
- Active NGINX connections


### Lessons Learned

As it turns out, this involved considerably more than just spinning up containers 😅

- Docker Compose networking
- Persistent Docker volumes
- Host networking vs bridge networking
- NGINX `stub_status`
- Prometheus scrape configuration
- PromQL query construction
- Docker restart policies
- YAML debugging and validation
- Systematic troubleshooting using logs and `curl`


I found nginx-exporter needlessly quarrelsome; I probably spent 4 hours banging my head against the wall getting it to talk to nginx.. I hope it's something environmental to me, but the only way I could get it to talk to nginx was to remove it from the docker network, and set it up on the host 🤷🏼‍♂️


### Future

I have improvements planned:

- Configure Alertmanager to chat to [ntfy.sh](ntfy.sh) for mobile notifs of downtime
- Implement Prometheus recording rules
- Move the whole stack onto a separate server so I don't have a single point of failure
