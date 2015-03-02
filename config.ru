require_relative "lib/repository_interface"
require_relative "lib/records_api"

db_path = 'database.json'
RepositoryInterface.register(:user, JSONRepository::User.new({db_path: db_path}))

run RecordsAPI
