# Nginx Files for CGNat Remote Host

There are currently two files in this director in addition to this README.md:

* docker-compose.yml
* default

The docker-compose.yml file is not currently used as I could not get nginx running in a container to proxy to a port on the host.

The default file is an nginx configuration file intended to be copied to /etc/nginx/sites-available/default on the host.