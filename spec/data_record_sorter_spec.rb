require 'data_record_sorter'

describe DataRecordSorter do
  let(:record1){ {last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "3/1/2000"} }
  let(:record2){ {last_name: "sampleLast", first_name: "sampleFirst", gender: "male", favorite_color: "clear", date_of_birth: "2/29/2000"} }
  let(:sample_record){ [ record1, record2 ] }
  let(:sorter){ DataRecordSorter.new(sample_record) }

  describe "#filter_record" do
    it 'filters records by desired field' do
      filter_field = "gender"
      filter_query = "female"
      expect(sorter.filter_record(filter_field, filter_query)).to eq([record1])
    end
  end
end
