# SRE Challenge - Warpnet

> Disclaimer: I am not a platform engineer and I do not have professional experience as a platform engineer. My background is in Linux system engineering. I had limited time to complete this challenge, so I focused on understanding the requirements, making the application more secure, and building a functional deployment using the tools provided.

I had no prior experience with some of the technologies used in this challenge, such as Kubernetes (kind). Vagrant and Docker were not completely new to me, although I had limited practical experience with them.

## Changes to the original challenge

The following changes did I made to the original Python application.

1. **Password logging**
   - Removed password values from application logs.

2. **Hardcoded Flask secret**
   - Removed the hardcoded Flask secret.
   - The secret is now provided through an environment variable.

3. **Plaintext passwords**
   - Passwords were previously stored and compared in plaintext.
   - Passwords are now hashed using Werkzeug's password hashing functionality.

HTTPS *****

I did not have enough time to further improve the SQLite database queries. The current implementation still queries the database more broadly than necessary.

I also added a health endpoint to allow the Kubernetes deployment to check whether the application is healthy.

## Docker & Kubernetes

To run the application in a container I used Docker. For managing the container I used kind (Kubernetes in Docker)

I chose to run one container containing the application to keep it simple. That means that the database also runs in the same container.

First I made a docker image that I could import into a kind cluster.

## Vagrant

I used Ansible to provision the Vagrant machine.

Ansible Vault is used to securely store the Flask secret. The secret is provided to the application as an environment variable in Linux on the VM.
The password to the Ansible vault is stored in .vault_pass in the Vagrant directory. This is needed by Vagrant to gain access to the vault. I'd rather use a password prompt during the provisioning of the Vagrant box, but I could't figure out in time how to get it working.

A systemd unit file is created to start the application automatically.

The application runs under a dedicated `warpnet` user rather than root.

## Installation - Vagrant machine

Go to the `vagrant` directory and execute:

```bash
vagrant up
```

Get the IP of the Vagrant machine add `:5000` to it and search it up. Example: `http://192.168.121.15:5000`

## Installation - Docker & Kubernetes

Install `docker`, `kind` and `kubectl` on your host.

Make sure your user is member of the `docker group`.

Allow the `deploy.sh` file to be executable:

```bash
chmod +x deploy.sh
```

Execute the following script:

```bash
./deploy.sh
```
