require_relative "lib/repository_interface"
require_relative "lib/records_api"

ENV['RACK_ENV'] == "test" ? path = { db_path: './support/test.json' } : path = { db_path: 'database.json' }

RepositoryInterface.register(:records, JSONRepository::Records.new(path))

run RecordsAPI
