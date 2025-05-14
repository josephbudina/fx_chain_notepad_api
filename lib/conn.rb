require 'sequel'
require 'dotenv/load'

DB = Sequel.connect(adapter: :postgres, user: ENV['USER'], password: 'password', host: ENV['HOST'], port: '5432',
                      database: ENV['DB'], max_connections: 10)

