# SRE challenge Warpnet
Clone this repository to your machine

## I have changed the following things in the original challenge.
The python script was not secure because of multiple things.
1. Logging passwords
2. Flask secret was hardcoded now it's being provided via environment variable
3. Plaintext passwords in database. Fixed by hashing password using werkzeug

I haven't had enough time to improve the querieng of the sqlite3 data base.

## Vagrant
I used ansible to provision the vagrant machine.
ansible uses ansible vault to store the flask secret that will be provided as enviroment variable in the vm.

## Installation Vagrant machine
Go to the vagrant folder and execute the following command: *vagrant up*.
