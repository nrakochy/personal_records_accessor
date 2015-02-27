require_relative "lib/records_api"

Repository.register(:user, YAMLRepository::UserRepository.new)

run RecordsAPI
