require 'data_record_sorter'

describe DataRecordSorter do
  let(:record1){ {last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "3/1/1980"} }
  let(:record1_reversed_date){ "1980/1/3" }
  let(:record2){ {last_name: "sampleLast", first_name: "sampleFirst", gender: "male", favorite_color: "clear", date_of_birth: "12/10/2000"} }
  let(:record2_reversed_date){ "2000/10/12" }
  let(:record3){ {last_name: "Last", first_name: "First", gender: "female", favorite_color: "black", date_of_birth: "4/10/1990"} }
  let(:sample_record){ [ record1, record2, record3 ] }
  let(:sorter){ DataRecordSorter.new(sample_record) }

  describe "#filter_record" do
    it 'filters records by gender' do
      filter_field = :gender
      filter_query = "female"
      expect(sorter.filter_records(filter_field, filter_query)).to contain_exactly(record1, record3)
    end

    it 'filters records by favorite_color' do
      filter_field = :favorite_color
      filter_query = "black"
      expect(sorter.filter_records(filter_field, filter_query)).to contain_exactly(record1, record3)
    end

  end

  describe "#sort_records_descending" do
    it 'returns an array sorted in descending order according to record gender' do
      filter_field = :gender
      expect(sorter.sort_records_descending(filter_field, sample_record)).to eq([record2, record1, record3])
    end

    it 'returns an array sorted in descending order according to record last_name' do
      filter_field = :last_name
      expect(sorter.sort_records_descending(filter_field, sample_record)).to eq([record2, record1, record3])
    end
  end


  describe "#sort_records_ascending" do
    it 'returns an array sorted in ascending order according to record gender' do
      filter_field = :gender
      expect(sorter.sort_records_ascending(filter_field, sample_record)).to include(record2, record1)
      expect(sorter.sort_records_ascending(filter_field, sample_record).last).to eq(record2)
    end

    xit 'returns an array sorted in ascending order according to record date_of_birth' do
      filter_field = :date_of_birth
      expect(sorter.sort_records_ascending(filter_field, sample_record)).to eq([record1, record3, record2])
    end
  end

  describe "#sort_records_ascending_by_DOB" do
    xit 'returns an array sorted in ascending order according to record date of birth' do
      expect(sorter.sort_records_ascending_order_by_DOB(sample_record)).to eq([record2, record1, record3])
    end
  end

  describe "#reverse_date_on_data_records" do
    it 'returns an array sorted in ascending order according to record date of birth' do
      records_with_reversed_dates = sorter.reverse_date_on_data_records(sample_record)
      first_record_with_reversed_date = records_with_reversed_dates.first
      expect(records_with_reversed_dates.class).to eq(Array)
      expect(first_record_with_reversed_date[:date_of_birth]).to eq(record1_reversed_date)
    end
  end

  describe "#reverse_split_date" do
    it 'returns the YYYY/D/M as a string from a given date string M/DD/YYYY' do
      sample_year = record1[:date_of_birth]
      expect(sorter.reverse_split_date(sample_year)).to eq(record1_reversed_date)
    end

    it 'returns the YYYY/DD/MM as a string from a given date string MM/DD/YYYY' do
      sample_year = record2[:date_of_birth]
      expect(sorter.reverse_split_date(sample_year)).to eq(record2_reversed_date)
    end

    it 'returns the correct format MM/DD/YYYY as a string from a reversed date string YYYY/DD/MM ' do
      expect(sorter.reverse_split_date(record1_reversed_date)).to eq(record1[:date_of_birth])
      expect(sorter.reverse_split_date(record2_reversed_date)).to eq(record2[:date_of_birth])
    end
  end
end
