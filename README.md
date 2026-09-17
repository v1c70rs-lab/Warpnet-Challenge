# SRE Challenge - Warpnet

> Disclaimer: I am not a platform engineer and I do not have professional experience as a platform engineer. My background is in Linux system engineering. I had limited time to complete this challenge, so I focused on understanding the requirements, making the application more secure, and building a functional deployment using the tools provided.

I had no prior experience with some of the technologies used in this challenge, such as Kubernetes (kind). Vagrant was not completely new to me, although I had limited practical experience with it.

## Changes to the original challenge

I made the following changes to the original application.

1. **Password logging**
   - Removed password values from application logs.

2. **Hardcoded Flask secret**
   - Removed the hardcoded Flask secret.
   - The secret is now provided through an environment variable.

3. **Plaintext passwords**
   - Passwords were previously stored and compared in plaintext.
   - Passwords are now hashed using Werkzeug's password hashing functionality.

I did not have enough time to further improve the SQLite database queries. The current implementation still queries the database more broadly than necessary.

I also added an additional health endpoint to allow the Kubernetes deployment to check whether the application is healthy.

## Vagrant

I used Ansible to provision the Vagrant machine.

Ansible Vault is used to securely store the Flask secret. The secret is provided to the application as an environment variable on the VM.

A systemd unit file is created to start the application automatically.

The application runs under a dedicated `warpnet` user rather than root.

## Installation - Vagrant machine

Go to the `vagrant` directory and execute:

```bash
vagrant up
