require 'grape'

class RecordsAPI < Grape::API

  resource :records do
  format :json

    desc "post a new record"
      post do
      end

    desc "get sorted records"
      params do
        optional :gender, type: Date, desc: "Records sorted by gender"
        optional :date_of_birth, type: Date, desc: "Records sorted by date of birth"
        optional :last_name, type: Date, desc: "Records sorted by last_name"
      end

      route_param :gender do
        get :gender do
          records = Repository.for(:user).find_all_records
          

        end
    end
  end
end

