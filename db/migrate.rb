require_relative '../app/conn'
Sequel.extension :migration

Sequel::Migrator.run(DB, 'db/migrations',  use_transactions: true, table: :schema_migrations)
