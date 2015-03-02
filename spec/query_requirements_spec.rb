require 'query_requirements'
require 'personal_record'

describe QueryRequirements do
  let(:record1){ PersonalRecord.new({last_name: "ALastName", first_name: "AFirstName", gender: "male", favorite_color: "black", date_of_birth: "03/01/1980"}) }
  let(:record2){ PersonalRecord.new({last_name: "BsampleLast", first_name: "BsampleFirst", gender: "female", favorite_color: "clear", date_of_birth: "01/10/2000"}) }
  let(:record3){ PersonalRecord.new({last_name: "CLast", first_name: "CFirst", gender: "female", favorite_color: "red", date_of_birth: "04/10/1990"}) }
  let(:record4){ PersonalRecord.new({last_name: "DLast", first_name: "DFirst", gender: "male", favorite_color: "orange", date_of_birth: "04/10/2010"}) }
  let(:params){ {record_sorter: DataRecordSorter.new, data_records: [record1, record2, record3, record4]} }
  let(:sorter){ QueryRequirements.new(params) }

  describe "#sort_by_gender_then_last_name_ascending" do
    it 'returns an array sorted by gender then last name' do
      records_sorted_by_gender_then_last_name = [ record2, record3, record1, record4 ]
      expect(sorter.sort_by_gender_then_last_name_ascending).to eq(records_sorted_by_gender_then_last_name)
    end
  end

  describe "#sort_by_birthdate_ascending" do
    it 'returns an array sorted by birthdate starting with the oldest bday' do
      records_sorted_by_birthdate_ascending = [ record1, record3, record2, record4 ]
      expect(sorter.sort_by_birthdate_ascending).to eq(records_sorted_by_birthdate_ascending)
    end
  end

  describe "#sort_by_last_name_descending" do
    it 'returns the records sorted by last name correctly' do
      records_sorted_by_last_name_descending = [ record4, record3, record2, record1 ]
      expect(sorter.sort_by_last_name_descending).to eq(records_sorted_by_last_name_descending)
    end
  end

  describe "#sort_by_query_requirements" do
    it 'returns an array of all sorted requirements' do
      by_gender_then_last_name = [ record2, record3, record1, record4 ]
      by_birthdate_ascending = [ record1, record3, record2, record4 ]
      by_last_name_descending = [ record4, record3, record2, record1 ]
      expect(sorter.sort_by_query_requirements).to contain_exactly(
        by_gender_then_last_name, by_birthdate_ascending, by_last_name_descending)
    end
  end
end
