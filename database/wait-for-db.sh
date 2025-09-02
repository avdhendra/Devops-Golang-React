#!/bin/sh
set -e

until nc -z db 5432; do
  echo "⏳ Waiting for Postgres..."
  sleep 2
done

echo "✅ Postgres is ready, running migrations..."
migrate -path=/migrations -database=$DB_URL up

