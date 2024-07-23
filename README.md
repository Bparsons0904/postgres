# PostgreSQL Database Initialization and Deployment

This README provides the steps to manually initialize PostgreSQL databases and manage the containers using Docker Compose and Drone CI.

## Prerequisites

- Docker
- Docker Compose
- PostgreSQL client (psql)
- Drone CI

## Step 1: Start PostgreSQL Containers Without Initialization Scripts

1. Modify the `docker-compose.yml` to start the PostgreSQL containers without the initialization scripts.

   ```yaml
   services:
     postgres_staging:
       image: postgres:latest
       container_name: postgres_staging
       environment:
         POSTGRES_USER: ${STAGING_DB_USER}
         POSTGRES_PASSWORD: ${STAGING_DB_PASSWORD}
         POSTGRES_DB: ${STAGING_DB_NAME}
       volumes:
         - postgres_staging_data:/var/lib/postgresql/data
       ports:
         - "5432:5432"
       restart: unless-stopped

     postgres_production:
       image: postgres:latest
       container_name: postgres_production
       environment:
         POSTGRES_USER: ${PROD_DB_USER}
         POSTGRES_PASSWORD: ${PROD_DB_PASSWORD}
         POSTGRES_DB: ${PROD_DB_NAME}
       volumes:
         - postgres_production_data:/var/lib/postgresql/data
       ports:
         - "5076:5432"
       restart: unless-stopped

   volumes:
     postgres_staging_data:
     postgres_production_data:
   ```
