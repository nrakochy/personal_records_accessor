require_relative "lib/repository_interface"
require_relative "lib/records_api"

configure(:test){ db_path = 'support/test.json' }
configure(:production){ db_path = 'database.json' }

RepositoryInterface.register(:records, JSONRepository::Records.new({db_path: db_path}))

run RecordsAPI
