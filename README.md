# SSH Reverse Tunnel to Get Around CGNAT

This code is based on the code from (this article)[https://theselfhosting.art/how-to-easily-self-host-at-home-and-put-your-projects-online-under-cgnat/].

It's divided up into artifacts needed for a local computer and those for a remote computer. The local artifacts consist of a script, `sshtunnel.sh`, and a systemd service definition file. The remote artifacts consist of a `docker-compose.yml` file used to start an nginx container and an nginx config file, `default`, used to configure nginx.
