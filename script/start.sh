#!/bin/bash

bundle check || bundle install

while ! pg_isready -h $POSTGRES_HOST -p $POSTGRES_PORT -q -U $POSTGRES_USER; do
  >&2 echo "Postgres is unavailable - sleeping..."
  sleep 5
done
>&2 echo "Postgres is up - executing commands..."

if bundle exec rails db:exists; then
	>&2 echo "Database exists, running migrations..."
	bundle exec rails db:migrate
else
	>&2 echo "Database doesn't exist, creating and running migrations..."
	bundle exec rails db:create
	bundle exec rails db:schema:load
fi

if [ -f $pidfile ] ; then
	>&2 echo 'Removing server PID file...'
	rm $pidfile
fi

>&2 echo 'Running processes...'
bundle exec rails s -p $APP_PORT -b $APP_HOST
