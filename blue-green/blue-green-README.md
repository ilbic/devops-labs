### What I've built here

A commit based, blue // green style deployment for a personal website. 

1. CI builds and validates
	- A minimal docker image of my site is automatically generated based on the site repo
	- Some linting and vulnerability scanning takes place
	- If everything is happy, the image is uploaded to the container registry
2. GitHub actions SSHs onto my droplet and starts the deployment
	- from there it runs /usr/local/bin/cd/deploy.sh and passes in the commit SHA 
	- deploy.sh checks which port nginx is serving, and sets the deployment port to be the opposite (4000/4001)
	- deploy.sh pulls the image from the registry and spins it up with it expecting traffic from the deployment port
3. Nginx is handled
	- A timestamped backup is created of the running nginx config for rollback and the new config is created
		- Only one line is edited so limited opportunity for failure
	- New config is validated and deployed
4. Cleanup
	- Old container is brought down and removed
	- Backup config is removed
	
