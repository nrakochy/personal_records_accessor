require 'grape'
require 'json'
class RecordsAPI < Grape::API

  format :json

  resource :records do
    desc "post a new record"
      post do
      end

    desc "get sorted records"
      get do
      end

      get :gender do
      end
  end
end

