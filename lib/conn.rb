require 'sequel'

DB = Sequel.connect(adapter: :postgres, user: ENV['HOST'], password: 'password', host: ENV['HOST'], port: '5432',
                      database: ENV['DB'], max_connections: 10, logger: Logger.new('log/db.log'))

