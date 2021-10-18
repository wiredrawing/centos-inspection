FROM  alpine



RUN apk update
RUN apk add which \
  postgresql \
  postgresql-contrib

RUN mkdir /run/postgresql
RUN chown postgres:postgres /run/postgresql

COPY ./init.sh  /tmp/init.sh

# 実行権限をもたせる
RUN chmod 0777 /tmp/init.sh

USER postgres

RUN initdb -D /var/lib/postgresql/data

#RUN pg_ctl start -D /var/lib/postgresql/data -w -t 120

RUN echo "listen_addresses = '*'" >> /var/lib/postgresql/data/postgresql.conf
RUN echo "host all all all md5" >> /var/lib/postgresql/data/pg_hba.conf

#RUN pg_ctl stop  -D /var/lib/postgresql/data -w -t 120


EXPOSE 5432


ENTRYPOINT [ "postgres", "-D", "/var/lib/postgresql/data" ]

