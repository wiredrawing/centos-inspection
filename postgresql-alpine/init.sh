#! /bin/ash
psql -U postgres -h localhost -c "create role admin with superuser login password 'admin'";
psql -U postgres -h localhost -c "create user general_user with createdb login password 'general_user'";
