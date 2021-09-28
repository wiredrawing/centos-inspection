FROM centos:latest




RUN dnf -y update && \
dnf -y install glibc-langpack-ja && \
dnf -y install postgresql-server && \
dnf -y install postgresql-contrib && \
dnf -y install which

USER postgres

RUN LANG=ja_JP.utf8 && \
export LANG && \
initdb -D /var/lib/pgsql/data && \
cd /var/lib/pgsql/data

RUN echo 'host all all all md5' >> /var/lib/pgsql/data/pg_hba.conf
RUN echo "listen_addresses  '*'" >> /var/lib/pgsql/data/postgresql.conf
RUN echo "port 5432" >> /var/lib/pgsql/data/postgresql.conf

EXPOSE 5432

# PID(プロセスID==1で動作するコマンドを記述)
CMD ["postgres", "-D", "/var/lib/pgsql/data"]
