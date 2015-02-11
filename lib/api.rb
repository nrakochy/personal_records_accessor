require 'grape'

class API < Grape::API
  resource :records do

    desc "post a new record"
    post do
    end

    desc "get sorted records"
    params do
      optional :gender, type: Date, desc: "Records sorted by gender"
      optional :date_of_birth, type: Date, desc: "Records sorted by date of birth"
      optional :last_name, type: Date, desc: "Records sorted by last_name"
    end

    route_param :sort_option do
      get '' do
      end
    end
  end
end

