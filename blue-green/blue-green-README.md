### Scope

I'll be following along with the scope defined [here](https://roadmap.sh/projects/blue-green-deployment), but I really want to take this project to the next level;

#### CI
- Containerise the site (this will also come in handy for the IaC challenge)
- Continue with GitHub actions to build
- Add markdown, html, dockerfile linting and maybe spellcheck and link checking, image vulnerability scanning, gitleaks, and stop deployment + notify if there's a failure!


#### CD
- Blue/green containers
- Add health checks for green container
	- If everything is hunky dory, switch traffic automatically
- Add rollback (so will need to retain the container for a short while)
- Prometheus automatically discovers the new instance + records the deployment time

#### Nice to have 
- Dependabot as I plan to pin images + dependencies
- Rollback button in GH
- ntfy.sh alerts on job failure + completion
