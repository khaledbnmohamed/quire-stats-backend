#!/bin/bash
set -e

if [ -f /home/quire_backend/quire_backend/tmp/pids/server.pid ]; then
  rm /home/quire_backend/quire_backend/tmp/pids/server.pid
fi

gem install bundler
bundle install
yarn install --check-files
overcommit --install
overcommit --sign

exec "$@"
