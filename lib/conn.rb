require 'sequel'
require 'logger'
require 'dotenv/load'

DB = Sequel.connect(adapter: :postgres, user: ENV['USER'], password: 'password', host: ENV['HOST'], port: '5432',
                      database: ENV['DLV'], max_connections: 10, logger: Logger.new($stdout))

