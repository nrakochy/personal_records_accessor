require 'api_mediator'

describe APIMediator do
  let(:record1){ PersonalRecord.new({last_name: "ALastName", first_name: "AFirstName", gender: "male", favorite_color: "black", date_of_birth: "03/01/1980"}) }
  let(:record2){ PersonalRecord.new({last_name: "BsampleLast", first_name: "BsampleFirst", gender: "female", favorite_color: "clear", date_of_birth: "01/10/2000"}) }
  let(:record3){ PersonalRecord.new({last_name: "CLast", first_name: "CFirst", gender: "female", favorite_color: "red", date_of_birth: "04/10/1990"}) }
  let(:record4){ PersonalRecord.new({last_name: "DLast", first_name: "DFirst", gender: "male", favorite_color: "orange", date_of_birth: "04/10/2010"}) }
  let(:params){ {record_sorter: DataRecordSorter.new, data_records: [record1, record2, record3, record4]} }
  let(:sorter){ QueryRequirements.new(params) }

  describe "#" do
    xit '' do
      expect(sorter.sort_by_gender_then_last_name_ascending).to eq(records_sorted_by_gender_then_last_name)
    end
  end

end
