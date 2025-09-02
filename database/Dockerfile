# Start from the official Postgres image
FROM postgres:16.3

# Copy init SQL into the folder Postgres scans on startup
COPY backend/scripts/db_init.sql /docker-entrypoint-initdb.d/db_init.sql
