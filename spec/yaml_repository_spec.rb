require 'yaml'
require_relative '../lib/yaml_repository'

describe YAMLRepository::User do

  let(:record1){ {last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "03/01/1980"}.to_yaml }
  let(:record1_hash){ {last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "03/01/1980"} }
  let(:record2){ {last_name: "LastName2", first_name: "FirstName2", gender: "female", favorite_color: "red", date_of_birth: "03/02/1980"}.to_yaml }
  let(:yml_path){ "test.yml" }
  let(:repo){ YAMLRepository::User.new({ db_path: yml_path }) }

  before :each do
    create_yaml_file
  end

  describe "#convert_record_to_yaml" do
    it 'correctly converts a Hash to Yaml' do
      expect(repo.convert_record_to_yaml(record1_hash)).to eq(record1)
    end
  end
end

def create_yaml_file
  test_data = [record1, record2]
  File.open(yml_path, 'w') { |file| YAML.dump(test_data, file) }
end
