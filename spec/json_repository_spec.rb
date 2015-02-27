require 'json'
require_relative '../lib/json_repository'

describe JSONRepository::User do

  let(:record1){ {last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "03/01/1980"}.to_json }
  let(:record1_hash){ {last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "03/01/1980"} }
  let(:record2){ {last_name: "LastName2", first_name: "FirstName2", gender: "female", favorite_color: "red", date_of_birth: "03/02/1980"}.to_json }
  let(:record3){ {last_name: "LastName3", first_name: "FirstName3", gender: "female", favorite_color: "orange", date_of_birth: "03/03/1980"}.to_json }
  let(:record4){ {last_name: "LastName4", first_name: "FirstName4", gender: "female", favorite_color: "blue", date_of_birth: "03/04/1980"}.to_json }
  let(:db_path){ "test.json" }
  let(:repo){ YAMLRepository::User.new({ db_path: db_path }) }

  before :each do
    @test_file = create_yaml_file
  end

  describe "#convert_record_to_yaml" do
    it 'correctly converts a Hash to Yaml' do
      expect(repo.convert_record_format(record1_hash)).to eq(record1)
    end
  end

  describe "#find_all_records" do
    it 'correctly retrieves yml file contents' do
      expect(repo.find_all_records).to eq([record1, record2])
    end
  end

  describe "#overwrite_data_records_file" do
    xit '' do
      expect(repo.convert_record_format(record1_hash)).to eq(record1)
    end
  end

end

def create_yaml_file
  test_data = [record1, record2]
  File.open(db_path, 'w') { |file| YAML.dump(test_data, file) }
end
