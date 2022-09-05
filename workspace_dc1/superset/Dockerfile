FROM apache/superset:master
# Switching to root to install the required packages
USER root
# Example: installing the MySQL driver to connect to the metadata database
# if you prefer Postgres, you may want to use `psycopg2-binary` instead
RUN rm -rf /var/lib/apt/lists/* \
    && apt update && apt install libldap2-dev libsasl2-dev \
    && pip install psycopg2-binary==2.9.1 pydruid python-ldap redis==3.5.3 mysqlclient
# Switching back to using the `superset` user
USER superset