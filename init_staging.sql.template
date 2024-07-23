-- Create the new database
CREATE DATABASE ${STAGING_DB_NAME};

-- Create a new superuser
CREATE USER ${STAGING_DB_USER} WITH PASSWORD '${STAGING_DB_PASSWORD}' SUPERUSER;

-- Grant privileges on the new database
GRANT ALL PRIVILEGES ON DATABASE ${STAGING_DB_NAME} TO ${STAGING_DB_USER};

-- Connect to 'postgres' database to perform administrative actions
\c postgres

-- Remove the default 'postgres' user
DROP USER IF EXISTS postgres;

-- Optional: Revoke public privileges
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO ${STAGING_DB_USER};
