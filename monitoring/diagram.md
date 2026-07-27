```
                     +------------------+
                     |     Grafana      |
                     |   Dashboards     |
                     +---------▲--------+
                               │
                            PromQL
                               │
                    +----------┴-----------+
                    |      Prometheus      |
                    +------+---------+-----+
                           │         │
                     Metrics│         │Alerts
                           │         ▼
                           │   +-------------+
                           │   |Alertmanager |
                           │   +------+------+
                           │          │
                           │          ▼
                           │       ntfy.sh
                           │          │
        ┌──────────────────┼──────────┼──────────────────┐
        │                  │          │                  │
        ▼                  ▼          │                  ▼
+---------------+  +---------------+  │      +------------------+
| Node Exporter |  |Blackbox Export|  │      | NGINX Exporter   |
+---------------+  +---------------+  │      +------------------+
        │                  │          │                  │
        ▼                  ▼          │                  ▼
   Linux Server      judah.sh HTTPS   │        NGINX stub_status
                                      │
                                      ▼
                               Mobile Notification
```
