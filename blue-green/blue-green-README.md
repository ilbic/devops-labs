### Sitrep

Working:

- Containerised the site with a multi stage Docker build
- GitHub Actions CI pipeline - yml provided
- Docker image scanning with Trivy
- Dockerfile linting with Hadolint
- Link and Markdown validation (which was too aggressive so I turned it off) 
- Publishing + retreiving images to // from  GitHub Container Registry
- Only ship what needs to ship - image is 92mb 

At the moment the commits + work are being tracked in my private website repo as I've been shipping to prod. 

The site is still working tho, some other milestones still need to be hit:

1. Write docker-compose.yml, in progress 
2. Write deploy.sh, also in progess
	3. Implement deployment slot detection
	4. Implement health checks
	5. Implement nginx switching
6. Automatic cleanup (shutting down old container)

Overkill for this project but "nice to have":

- Docker HEALTHCHECK
- cAdvisor
- Blackbox Exporter
- Grafana deployment dashboard
- ntfy.sh deployment notifications
- Automatic rollback
- Deploy by image digest instead of tag

