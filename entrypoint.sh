#!/bin/bash
set -e

rm -f /repertory_app/tmp/pids/server.pid

exec "$@"
