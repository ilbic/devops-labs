                         ┌─────────────────────┐
                         │     GitHub commit   │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   GitHub Actions    │
                         │                     │
                         │ Build               │
                         │ Lint                │
                         │ Vulnerability scan  │
                         └──────────┬──────────┘
                                    │
                              commit SHA
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │       GHCR          │
                         │                     │
                         │ judah.sh:<SHA>      │
                         └──────────┬──────────┘
                                    │
                              docker pull
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │     deploy.sh       │
                         │       (sudo)        │
                         └──────────┬──────────┘
                                    │
                         determine current port
                                    │
                         ┌──────────┴──────────┐
                         │                     │
                     Port 4000             Port 4001
                         │                     │
                         ▼                     ▼
                   Deploy to 4001         Deploy to 4000
                         │                     │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │ Candidate container │
                         │                     │
                         │ judah-sh-4000/4001  │
                         └──────────┬──────────┘
                                    │
                              HTTP health check
                                    │
                              ┌─────┴─────┐
                              │           │
                            FAIL        PASS
                              │           │
                              ▼           ▼
                           ABORT     Backup NGINX
                                      config
                                         │
                                         ▼
                                  Change proxy_pass
                                         │
                                         ▼
                                     nginx -t
                                    ┌────┴────┐
                                  FAIL      PASS
                                    │          │
                                    ▼          ▼
                                 Restore    Reload
                                 config     NGINX
                                    │          │
                                    ▼          ▼
                              Remove new   New container
                               container      becomes
                                              primary
                                                 │
                                                 ▼
                                           Remove old
                                            container
