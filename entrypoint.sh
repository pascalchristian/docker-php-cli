#!/bin/sh
groupmod --gid "${PGID}" phpgroup
usermod --uid "${PUID}" phpuser
exec gosu phpuser bash


