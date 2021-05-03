[main]
host = {{ .Env.NSS_MYSQL_HOST }}
database = {{ .Env.NSS_MYSQL_DB }}
username = {{ .Env.NSS_MYSQL_USER }}
password = {{ .Env.NSS_MYSQL_PASSWORD }}
port = {{ default .Env.NSS_MYSQL_PORT "3306" }}
