### Prometheus
- ~~Set up persistent storage via docker compose~~
- ~~Configure scraping of nginx~~
- ~~Configure scraping of blackbox~~

### Blackbox, Nginx, Node
- Configure relevant scraping metrics (?)
- ~~Nginx: connect to actual webserver~~
- ~~Blackbox: decide what metrics to actually scrape~~

### Grafana
- ~~Install + plug in~~
- ~~Decide on which metrics?~~
- Build following dashboards:

####Host

CPU utilisation
Memory utilisation
Disk utilisation
Filesystem free space

####Website

probe_success
probe_duration_seconds
SSL certificate expiry

####NGINX

Active connections
Reading / Writing / Waiting connections
Requests served (if available from your exporter version)

### Alertmanager
- Alerts via smtp? Or healthchecks.io ping?
