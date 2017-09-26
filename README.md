# grotevriendelijkedames.nl

This domain has two subdomains

* www.grotevriendelijkedames.nl
* admin.grotevriendelijkedames.nl

# Configuration

At this moment only the apache configuration is relevant. You can locate this in grotevriendelijkedames.nl-site/apache2.
There are 2 configuration files:

* admin-grotevriendelijkedames-nl.config
* wwww-grotevriendelijkedames-nl.config

## Backup

Each day around 9:00 PM the backup is executed on [jenkins.haakma.org](http://jenkins.haakma.org/job/haakma-org/job/grotevriendelijkedames-nl/).
The backups are located on the host:

* /home/#user#/backup/#domain#/#domain#_#subdomain#.tar
* /home/#user#/backup/#domain#/#domain#_#subdomain#.sql

## Slack

You can signup to the slack account [haakma.slack.com](https://haakma.slack.com/messages/C78LC03J7) and receive notification messages of backups and other administrative processes.
