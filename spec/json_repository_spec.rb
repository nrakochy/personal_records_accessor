require 'json'
require_relative '../lib/json_repository'

describe JSONRepository::User do

  let(:record1){ {last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "03/01/1980"} }
  let(:record2){ {last_name: "LastName2", first_name: "FirstName2", gender: "female", favorite_color: "red", date_of_birth: "03/02/1980"} }
  let(:record3){ {last_name: "LastName3", first_name: "FirstName3", gender: "female", favorite_color: "orange", date_of_birth: "03/03/1980"} }
  let(:record4){ {last_name: "LastName4", first_name: "FirstName4", gender: "female", favorite_color: "yellow", date_of_birth: "03/04/1980"} }
  let(:db_path){ "./spec/support/test.json" }
  let(:repo){ JSONRepository::User.new({ db_path: db_path }) }

  before :each do
    @test_file = create_test_file
  end

  describe "#" do
    it 'adds a comma to a JSON record' do
      record_json = (record1.to_json)
      json_with_comma = record_json + ', '
      expect(repo.add_comma_to_record(record_json)).to eq(json_with_comma)
    end
  end

  describe "#find_all_records" do
    it 'correctly retrieves file contents' do
      expect(repo.find_all_records).to include(record1.to_json)
      expect(repo.find_all_records).to include(record2.to_json)
    end
  end

  describe "#overwrite_data_records_file" do
    it 'overwrites a new file on the same db_path each time initialized' do
      new_file = repo.overwrite_data_records_file([record3, record4])
      expect(new_file == @test_file).to be false
    end
  end

  describe "#save" do
    it 'saves a new entry to the db' do
      repo.save(record3)
      all_records = repo.find_all_records
      expect(all_records).to include(record3.to_json)
    end
  end


end

def create_test_file
  test_data = [record1, record2]
  File.open(db_path, 'w') do |file|
    test_data.each do |record|
      formatted_data = record.to_json + ','
      file.write(formatted_data)
    end
  end
end
