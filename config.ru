require_relative "records_api"
require_relative "lib/repository_interface"

RepositoryInterface.register(:user, YAMLRepository::UserRepository.new)

run RecordsAPI
