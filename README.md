LANPP
=====

LANPP - Server Configuration Scripts (Linux Apache+Nginx Percona PHP)

This configuration based on Debian 7 (Wheezy) Distro.
Install actions are semi-automated for better control.
All scripts run from root user (or via su/sudo) on CLEAN system.

Install instructions:

0. Install Debian 7 (I recommend using netinst image) and sudo, aptitude packages

1. Run "apt-setup-repos.sh"

2. Run "install-packages.sh"

3. For each hosted site create copy of "create-user-example.com.sh" and edit first lines in it:
```bash
user="org.example"  # linux user and group to create
domain="example.org"  # operating domain (both naked and www.* will be created)
database="orgexample" # database name (mysql database naming conventions - best if database name fit in 16 symbols)
```

4. Run copy of "create-user-example.com.sh"
It create all needed folders, configs and database objects.
Database credentials are stored in /home/${user}/mysql-credentials.txt file.
Create script add two database users - with full rights and rou-user (read only user).

5. [Optional] Edit fist line in "wiki-prep.sh" and run it.
It print all information about connection to server. You can copy this information into you project wiki.



Additional Information
------
#### Manual MySQL/Percona configuration (not automatized yet)

1. Set UTF-8 Encoding to default on server
Open /etc/mysql/my.cnf and insert line below in [mysqld] section
```
character-set-server=utf8
init-connect='SET NAMES utf8;'
```

2. Set UTF-8 Encoding to default on client
Open /etc/mysql/my.cnf and insert line below in [mysql] section
```
default-character-set=utf8
```

3. Restart MySQL/Percona daemon
```bash
sudo service mysql restart
```

#### Apc configutation
Copy apc.ini in proper location (/etc/php5/mods-available/apc.ini)