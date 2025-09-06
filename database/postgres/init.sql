-- Create user only if not exists
DO
$$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles WHERE rolname = 'db_beta'
   ) THEN
      CREATE ROLE db_beta LOGIN PASSWORD 'beta@secure@pass';
   END IF;
END
$$;

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE db_beta TO db_beta;
