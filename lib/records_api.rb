require 'grape'
require 'incoming_records_parser'

class RecordsAPI < Grape::API

  resource :records do

    desc "post a new record"
    post '/records' do
    end

    desc "get sorted records"
    params do
      optional :gender, type: Date, desc: "Records sorted by gender"
      optional :date_of_birth, type: Date, desc: "Records sorted by date of birth"
      optional :last_name, type: Date, desc: "Records sorted by last_name"
    end

    route_param :gender do
      get :gender do
      end
    end
  end
end

