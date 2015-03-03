require 'rack/test'
require 'records_api'

describe RecordsAPI do
  include Rack::Test::Methods

   def app
     Rack::Builder.parse_file(File.dirname(__FILE__) + '/../config.ru').first
   end

  describe RecordsAPI do
    describe "GET /records" do
      it "returns all records in the DB" do
        get "/records"
        expect(last_response.status).to eq(200)
      end
    end
    describe "GET /records/gender" do
      it "returns DB records sorted by gender" do
        get "/records/gender"
        expect(last_response.status).to eq(200)
        #expect(last_response.body).to eq()
      end
    end
  end
end
