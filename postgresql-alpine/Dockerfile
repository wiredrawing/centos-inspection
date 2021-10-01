FROM  alpine



RUN apk update
RUN apk add which \
postgresql \
postgresql-contrib

RUN mkdir /run/postgresql
RUN chown postgres:postgres /run/postgresql

USER postgres

RUN initdb -D /var/lib/postgresql/data

#RUN pg_ctl start -D /var/lib/postgresql/data -w -t 120

RUN echo "listen_addresses = '*'" >> /var/lib/postgresql/data/postgresql.conf
RUN echo "host all all all md5" >> /var/lib/postgresql/data/pg_hba.conf

#RUN psql -U postgres -h localhost -c "create role admin with superuser login password 'admin';"
#RUN psql -U postgres -h localhost -c "create user general_user with createdb login password 'general_user';"

#RUN pg_ctl stop  /var/lib/postgresql/data -w -t 120 -D

EXPOSE 5432


ENTRYPOINT [ "postgres", "-D", "/var/lib/postgresql/data" ]
