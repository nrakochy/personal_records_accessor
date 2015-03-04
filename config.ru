$:.unshift File.expand_path("../lib/", __FILE__)

require "repository_interface"
require "records_api"

ENV['RACK_ENV'] == "test" ? (path = './support/test.json') : (path = 'database.json')

RepositoryInterface.register(:records, JSONRepository::Records.new({db_path: path}))

run RecordsAPI
