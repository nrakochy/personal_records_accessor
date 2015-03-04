require 'json'
require 'endpoint_presenter'

describe EndpointPresenter do
  let(:presenter){ EndpointPresenter.new }
  let(:record1){ { last_name: "sampleLast", first_name: "sampleFirst", gender: "male", favorite_color: "clear", date_of_birth: "01/10/2000"} }

  describe "#format_http_response" do
    it "returns a record as json with {status: data:{} } format" do
      http_response = { status: "success", data: { records: record1 }}.to_json
      expect(presenter.format_http_response(record1)).to eq(http_response)
    end
  end
end
