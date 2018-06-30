# notifyme

- Notificate when my externall ip change.
- Used in crontab
- expect an email on $1

## dependencies
- sudo apt-get install mailutils
- ipecho.net/plain

## crontab sample

every 30 minutes
*/30 * * * * cd /your/path/notifyme && ./notifyme.sh myemail@server.com >> notifyme.log