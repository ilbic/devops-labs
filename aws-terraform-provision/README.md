### What I've achieved

A script that automatically provisions all the infrastructure and server configuration for  my personal website from source control. The script currently takes about 5 mins to run.
I built this mainly as a "disaster recovery" exercise and so I've neglected to configure a connection to my existing CI pipeline.

### Nice to haves

- Timing  each step of the process, e.g "How long does SSH take to become available?", "How long does it take docker to become available?", "How long does DNS take to propagate?", "How long does the whole process take?". In a real DR situation stakeholders would want to know how quickly service could be restored.
- Verification the service is actually running - http checks etc
- Further hardening to SSH, create an appropriate security group on the fly
- Configure TLS for the site automatically
- Automatically connect to a monitoring stack