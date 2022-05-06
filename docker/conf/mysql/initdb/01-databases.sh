#!/bin/bash
# --------------------------------------
#  Create test database and user
# --------------------------------------
mysql -uroot -p$DB_ROOT_PASSWORD -e "create database if not exists $DB_TEST_NAME"
mysql -uroot -p$DB_ROOT_PASSWORD -e "create user if not exists '{$DB_TEST_USER}'@'%' identified by '{$DB_TEST_PASSWORD}'"
mysql -uroot -p$DB_ROOT_PASSWORD -e "grant all privileges on $DB_TEST_NAME.* to '{$DB_TEST_USER}'@'%'"
