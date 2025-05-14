require_relative '../lib/conn'
Sequel.extension :migration

Sequel::Migrator.run(DB, 'db/migrations',  use_transactions: true)
