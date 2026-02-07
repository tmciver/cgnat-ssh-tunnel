# SSH Reverse Tunnel to Get Around CGNAT

This code is based on the code from (this article)[https://theselfhosting.art/how-to-easily-self-host-at-home-and-put-your-projects-online-under-cgnat/].

This project is used to establish a reverse SSH tunnel from a proxy server to an application server for the purpose of allowing traffic initiated from the internet to be serviced by a server behind CGNAT (Common Gateway Network Address Translation).

## Set Up

### The Application Server

The reverse SSH tunnel is initiated on an application server which is behind CGNAT by running the script `./app-server/bin/sshtunnel.sh`. Since one does not want to have to run this script manually when the server is rebooted, a systemd service is used to run the script on startup. To do this, create a link to `sshtunnel.service` with:

    $ sudo ln -s <project-dir>/app-server/sshtunnel.service /etc/systemd/system/

and restart the server. (TODO: Is this enough or does the service have to be enabled first?)

### The Proxy Server

The proxy server must be a server on the internet that is not behind the CGNAT boundary. This proxy uses nginx to direct traffic to the local SSH tunnel currently on port 8096. The nginx server is additionally used as a TLS termination. A wildcard certificate for *.timmciver.com is used for this. For this reason, you must ensure that the certificate (`cert.pem`) and the private key (`privkey.pem`) are present in the `./etc/letsencrypt/live/timmciver.com` subdirectory of this project (they may have to be created).

Once that is done, just start the Docker container with:

    $ docker compose up -d

TODO: set up certbot to auto-renew ther wildcard cert.
