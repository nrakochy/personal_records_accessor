require 'json_repository'
require 'personal_record'

describe JSONRepository::Records do

  let(:record1){ PersonalRecord.new({last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "03/01/1980"}) }
  let(:record2){ PersonalRecord.new({last_name: "LastName2", first_name: "FirstName2", gender: "female", favorite_color: "red", date_of_birth: "03/02/1980"}) }
  let(:record3){ PersonalRecord.new({last_name: "LastName3", first_name: "FirstName3", gender: "female", favorite_color: "orange", date_of_birth: "03/03/1980"}) }
  let(:record4){ PersonalRecord.new({last_name: "LastName4", first_name: "FirstName4", gender: "female", favorite_color: "yellow", date_of_birth: "03/04/1980"}) }
  let(:parsed_record1){ record1.read_record_attributes_without_reformatted_date_included }
  let(:parsed_record2){ record2.read_record_attributes_without_reformatted_date_included }

  let(:db_path){ "./support/test.json" }
  let(:repo){ JSONRepository::Records.new({ db_path: db_path }) }

  before :each do
    @test_file = create_test_file
  end

  describe "#overwrite_data_records_file" do
    it 'overwrites a new file on the same db_path each time initialized' do
      new_file = repo.overwrite_data_records_file([record3, record4])
      expect(new_file == @test_file).to be false
    end
  end

  describe "#find_all_records" do
    it 'correctly retrieves file contents' do
      expect(repo.find_all_records.class).to eq(Array)
      expect(repo.find_all_records.first).to eq(parsed_record1)
      expect(repo.find_all_records.last).to eq(parsed_record2)
    end
  end

  describe "#save" do
    it 'saves a new entry to the db' do
      returned_record = repo.save(record3)
      expect(returned_record).to eq(record3)
    end
  end
end

def create_test_file
  test_data = [record1, record2]
  repo.overwrite_data_records_file(test_data)
end
