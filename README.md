# PostgreSQL Database with UUID7 Extension

This repository contains configuration for setting up and deploying PostgreSQL databases with the UUID7 extension using Docker, Docker Compose, and Drone CI.

## Key Features

- Custom PostgreSQL image with UUID7 extension
- Separate staging and production environments
- Automated deployment using Drone CI
- Docker Compose for local development and testing

## Prerequisites

- Docker and Docker Compose
- Drone CI server (for automated deployments)

## Quick Start

1. Clone this repository
2. Set up your environment variables (see "Environment Variables" section)
3. Run `docker-compose up -d` to start the databases locally

## Environment Variables

The following environment variables need to be set in your Drone CI secrets:

- `STAGING_DB_USER`: Username for staging database
- `STAGING_DB_PASSWORD`: Password for staging database
- `STAGING_DB_NAME`: Name of staging database
- `PROD_DB_USER`: Username for production database
- `PROD_DB_PASSWORD`: Password for production database
- `PROD_DB_NAME`: Name of production database

## Deployment

Deployment is handled automatically by Drone CI:

- Pushing to the `main` branch triggers a deployment to the staging environment
- Creating a new tag (e.g., `v1.0.0`) triggers a deployment to the production environment

## Custom PostgreSQL Image

The custom PostgreSQL image includes the UUID7 extension. The Dockerfile for this image is included in this repository.

## Database Initialization

Database extensions are automatically initialized using the `init-extentions.sql` script, which is copied into the Docker image.

## Local Development

Use `docker-compose up -d` to start the databases locally. The staging database will be available on port 5080, and the production database on port 5076.

## Manual Creation

```sql
CREATE DATABASE switches OWNER waugze;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_uuidv7";
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
CREATE DATABASE switches_dev OWNER waugze;
```
