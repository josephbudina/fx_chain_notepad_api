# Rakefile
require 'rake'
require 'dotenv/load'

db = ENV['DB_NAME']
user = ENV['DB_USER']

namespace :db do
  desc "Create the database"
  task :create do
    sh "createdb -U #{user} #{db}"
  end

  desc "Drop the database"
  task :drop do
    sh %Q(psql -U #{user} -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '#{db}' AND pid <> pg_backend_pid();")
    sh "dropdb -U #{user} #{db}"
  end

  desc "Run migrations"
  task :migrate do
    sh "ruby db/migrate.rb"
  end

  desc "Reset the database"
  task :reset => [:drop, :create, :migrate]
end
