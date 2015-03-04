require 'grape'
require 'json'
require 'api_mediator'

class RecordsAPI < Grape::API

format :json

  resource :records do
    desc "post a new record"
    params do
      requires :record, type: String, desc: "save a record to the db"
    end
    post do
      data = request.body.read.to_s
      APIMediator.new.save_posted_record(data)
    end

    desc "get sorted records"
    get do
      APIMediator.new.get_all_db_records
    end

    desc "returns all db records sorted by gender"
    get :gender do
      APIMediator.new.get_records_sorted_by_query(:gender)
    end

    desc "returns all db records sorted by last name"
    get :name do
      APIMediator.new.get_records_sorted_by_query(:last_name)
    end

    desc "returns all db records sorted by birthday"
    get :birthdate do
      APIMediator.new.get_records_sorted_by_query(:date_year_month_day)
    end
  end
end

