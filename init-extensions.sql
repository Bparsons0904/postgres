\echo 'Starting initialization script'
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
\echo 'uuid-ossp extension created'
CREATE EXTENSION IF NOT EXISTS "pg_uuidv7";
\echo 'pg_uuidv7 extension created'
\echo 'Initialization script completed'
