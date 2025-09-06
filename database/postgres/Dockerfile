FROM postgres:16

# Set environment variables (values will be passed via docker-compose .env or build args)
ENV POSTGRES_DB=$POSTGRES_DB
ENV POSTGRES_USER=$DB_USER
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD
ENV POSTGRES_PORT=5432


# Copy initialization SQL script
COPY ./init.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL port
EXPOSE 5432
