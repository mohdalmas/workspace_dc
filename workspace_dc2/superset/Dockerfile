FROM apache/superset:2.0.1rc1-dev
# Switching to root to install the required packages
USER root
# Example: installing the MySQL driver to connect to the metadata database
# if you prefer Postgres, you may want to use `psycopg2-binary` instead
RUN rm -rf /var/lib/apt/lists/* \
    && apt update && apt install libldap2-dev libsasl2-dev -y \
    && pip install psycopg2-binary==2.9.1 pydruid python-ldap redis==3.5.3 mysqlclient PyHive elasticsearch-dbapi cx_Oracle pymssql pyodbc 
# COPY saf.png /app/superset/static/assets/images/saf.png
# COPY saf-fav.png /app/superset/static/assets/images/saf-fav.png
# COPY theme.4639b060fd9b6a4b89fb.entry.css /app/superset/static/assets/theme.4639b060fd9b6a4b89fb.entry.css
# Switching back to using the `superset` user
USER superset