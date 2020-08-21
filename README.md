# WLMOJ Backup Handler
TODO

## Installation

### Server
First, clone this git repository into the home directory of a new user (`backup`).

Next, install the dependencies by running `bundle install` in the root directory of the repository.

Then, copy the included service file `wlmoj-backup.service` to `/etc/systemd/system/`. Then run the following commands as root:
```sh
systemctl enable wlmoj-backup.service
systemctl start wlmoj-backup.service
```

You can check if the service is running with `systemctl status wlmoj-backup.service`.

#### Zerotier
If you want to run this over zerotier only, first change the `After` line in your service file to the following:
```
After=network-online.target zerotier-one.service
```
Then change the `BIND_ADDRESS` in your service file to your local zerotier ip.

#### RVM
If using RVM to manage ruby versions, you will likely need to generate a wrapper script for the gems to be viewed properly (see [this page](https://rvm.io/integration/init-d)).

### Client
TODO
