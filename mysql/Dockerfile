FROM mysql:8.2.0

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password
ENV MYSQL_DATABASE=testdb

COPY conf/init.sql /docker-entrypoint-initdb.d/

HEALTHCHECK --interval=5s --timeout=3s --start-period=5s --retries=5 \
  CMD mysqladmin ping -h localhost -u root -proot || exit 1