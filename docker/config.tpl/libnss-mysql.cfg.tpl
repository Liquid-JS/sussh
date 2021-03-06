getpwnam    SELECT username,'x',uid,gid,gecos,homedir,shell \
            FROM users \
            WHERE username='%1$s' \
            LIMIT 1
getpwuid    SELECT username,'x',uid,gid,gecos,homedir,shell \
            FROM users \
            WHERE uid='%1$u' \
            LIMIT 1
getspnam    SELECT username,password,lstchg,min,max,warn,inact,expire,flag \
            FROM users \
            WHERE username='%1$s' \
            LIMIT 1
getpwent    SELECT username,'x',uid,gid,gecos,homedir,shell \
            FROM users
getspent    SELECT username,password,lstchg,min,max,warn,inact,expire,flag \
            FROM users
getgrnam    SELECT name,password,gid \
            FROM groups \
            WHERE name='%1$s' \
            LIMIT 1
getgrgid    SELECT name,password,gid \
            FROM groups \
            WHERE gid='%1$u' \
            LIMIT 1
getgrent    SELECT name,password,gid \
            FROM groups
memsbygid   SELECT username \
            FROM grouplist \
            WHERE gid='%1$u'
gidsbymem   SELECT gid \
            FROM grouplist \
            WHERE username='%1$s'

host        {{ .Env.NSS_MYSQL_HOST }}
database    {{ .Env.NSS_MYSQL_DB }}
username    {{ .Env.NSS_MYSQL_USER }}
password    {{ .Env.NSS_MYSQL_PASSWORD }}
port        {{ default .Env.NSS_MYSQL_PORT "3306" }}
