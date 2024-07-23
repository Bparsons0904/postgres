-- Create the new database
CREATE DATABASE ${PRODUCTION_DB_NAME};

-- Create a new superuser
CREATE USER ${PRODUCTION_DB_USER} WITH PASSWORD '${PRODUCTION_DB_PASSWORD}' SUPERUSER;

-- Grant privileges on the new database
GRANT ALL PRIVILEGES ON DATABASE ${PRODUCTION_DB_NAME} TO ${PRODUCTION_DB_USER};

-- Connect to 'postgres' database to perform administrative actions
\c postgres

-- Remove the default 'postgres' user
DROP USER IF EXISTS postgres;

-- Optional: Revoke public privileges
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO ${PRODUCTION_DB_USER};
