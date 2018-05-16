# New Server Initialization

We spend a lot of time on DigitalOcean provisioning new servers, and have a standard configuration for LEMP stack servers. This is an evolving
quick setup script to help with doing the more mundane work.

It includes:

 - `mysql_secure_installation`
 - Setting up a new user & adding them to the sudoers file
 - Setting up `ssh` for said user
 - Installing our favourite [git-aware-prompt](https://github.com/jimeh/git-aware-prompt)
 - Adding up/down arrow autocomplete to history
 - Ensuring `unattended-upgrades` is installed and configured
 - Adding a shell script for [configuring nginx virtualhosts](https://github.com/thrasherht/virtualhost/)*

 
Usage:

```
$> ./new-server.sh {username}
```

Just follow the prompts afterward.

***NOTE**: We used a fork that had fixed a particular directory referencing issue.
