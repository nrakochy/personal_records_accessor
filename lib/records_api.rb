require 'grape'
require 'json'
require_relative 'data_record_sorter'
require_relative 'repository_interface'
require_relative 'query_requirements'

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
        record_sorter = DataRecordSorter.new
        db_records = RepositoryInterface.for(:user).find_all_records
        parsed_db_records = JSON.parse(db_records)
        data_records = create_personal_record_objects(parsed_db_records)
        query_req_params = {record_sorter: record_sorter, data_records: data_records }
        sorted_records = QueryRequirements.new(query_req_params).sort_by_gender_then_last_name_ascending
        sorted_records.to_json
      end
  end

  def create_personal_record_objects(data_records)
    converted_records = data_records.map{ |record| PersonalRecord.new(record) }
    converted_records.map{|record| record.read_record_attributes_without_reformatted_date_included }
  end
end

