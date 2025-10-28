require_relative '../app/conn'

Sequel.extension :pg_json
DB.extension :pg_json

Sequel.extension :migration

Sequel::Migrator.run(DB, 'db/migrations',  use_transactions: true, table: :schema_migrations)
