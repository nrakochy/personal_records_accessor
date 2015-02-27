require 'grape'
require 'json'
require_relative 'lib/data_record_sorter'
require_relative 'lib/repository_interface'
require_relative 'reverb_reqs/query_requirements'

class RecordsAPI < Grape::API

  format :json

  resource :records do
    desc "post a new record"
      post do
      end

    desc "get sorted records"
      get do
        RepositoryInterface.for(:user).find_all_records
      end

      get :gender do
        @record_sorter = DataRecordSorter.new
        @data_records = RepositoryInterface.for(:user).find_all_records
        query_req_params = {record_sorter: @record_sorter, data_records: @data_records }
        @query_reqs = QueryRequirements.new(query_req_params)
        sorted_records = @query_reqs.sort_by_gender_then_last_name_ascending
        sorted_records.to_json
      end
  end
end

