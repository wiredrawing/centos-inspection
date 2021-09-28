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

EXPOSE 5432

CMD ["postgres", "-D", "/var/lib/pgsql/data"]
