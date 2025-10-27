require 'sequel'
require 'logger'
require 'dotenv/load'

DB = Sequel.connect(adapter: :postgres,
                    user: ENV['DB_USER'],
                    password: 'password',
                    host: ENV['HOST'],
                    port: '5432',
                    database: ENV['DB_NAME'],
                    max_connections: 10,
                    logger: Logger.new($stdout)
                   )
## eventually setup test env
Sequel::Model.db = DB
