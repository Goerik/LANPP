#!/bin/bash

user="org.example"
domain="example.org"
database="orgexample"

dbcred=$(cat /home/${user}/mysql-credentials.txt);
sshcred=$(cat /home/${user}/.ssh/${user}_dsa);

echo "h1. Dev Server

DevUrl: http://$domain

h2. Access by ssh site key

Private Key
<pre>
$sshcred
</pre>

Example commands
<pre>
ssh -i /path/to/file/${user}_dsa ${user}@$domain
sshfs -o IdentityFile=/path/to/file/${user}_dsa ${user}@$domain:/home/${user}/www /path/to/local/folder
</pre>

h2. Database credetentials

<pre>
$dbcred
</pre>"

