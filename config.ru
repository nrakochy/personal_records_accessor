require_relative "records_api"
require_relative "lib/repository_interface"


RepositoryInterface.register(:user, YAMLRepository::User.new)

run RecordsAPI
