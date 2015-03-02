require 'data_record_sorter'
require 'personal_record'

describe DataRecordSorter do
  let(:record1){ PersonalRecord.new({last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "03/01/1980"}) }
  let(:record2){ PersonalRecord.new({last_name: "sampleLast", first_name: "sampleFirst", gender: "male", favorite_color: "clear", date_of_birth: "01/10/2000"}) }
  let(:record3){ PersonalRecord.new({last_name: "Last", first_name: "First", gender: "female", favorite_color: "black", date_of_birth: "04/10/1990"}) }
  let(:sample_records){ [ record1, record2, record3 ] }
  let(:sorter){ DataRecordSorter.new }

  describe "#filter_record" do
    it 'filters records by gender' do
      filter_field = :gender
      filter_query = "female"
      expect(sorter.filter_records(filter_field, filter_query, sample_records)).to contain_exactly(record1, record3)
    end

    it 'filters records by favorite_color' do
      filter_field = :favorite_color
      filter_query = "black"
      expect(sorter.filter_records(filter_field, filter_query, sample_records)).to contain_exactly(record1, record3)
    end
  end

  describe "#sort_records_descending" do
    it 'returns an array sorted in descending order according to record gender' do
      filter_field = :gender
      expect(sorter.sort_records_descending(filter_field, sample_records)).to eq([record2, record1, record3])
    end

    it 'returns an array sorted in descending order according to record last_name' do
      filter_field = :last_name
      expect(sorter.sort_records_descending(filter_field, sample_records)).to eq([record2, record1, record3])
    end
  end


  describe "#sort_records_ascending" do
    it 'returns an array sorted in ascending order according to record gender' do
      filter_field = :gender
      expect(sorter.sort_records_ascending(filter_field, sample_records)).to include(record2, record1)
      expect(sorter.sort_records_ascending(filter_field, sample_records).last).to eq(record2)
    end

    it 'returns an array sorted in ascending order according to record date_of_birth' do
      filter_field = :date_of_birth
      expect(sorter.sort_records_ascending(filter_field, sample_records)).to eq([record1, record3, record2])
    end
  end

  describe "#sort_records_ascending_by_DOB" do
    it 'returns an array sorted in ascending order according to record date of birth' do
      expect(sorter.sort_records_ascending_order_by_DOB(sample_records)).to eq([record1, record3, record2])
    end
  end

end
