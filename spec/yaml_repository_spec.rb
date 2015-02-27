require 'yaml'
require_relative '../lib/yaml_repository'

describe YAMLRepository::User do

  let(:record1){ {last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "03/01/1980"}.to_yaml }
  let(:record2){ {last_name: "LastName2", first_name: "FirstName2", gender: "female", favorite_color: "red", date_of_birth: "03/02/1980"}.to_yaml }
  let(:yml_path){ "test.yml" }
  let(:repo){ YAMLRepository::User.new(yml_path) }

  before :each do
    create_yaml_file
  end

  describe "#filter_record" do
    it 'filters records by gender' do
      expect(sorter.filter_records(filter_field, filter_query, sample_records)).to contain_exactly(record1, record3)
    end
  end
end

def create_yaml_file
  test_data = [record1, record2]
  File.open(yml_path, "w"){ |f| f.write YAML::dump(test_data) }
end
