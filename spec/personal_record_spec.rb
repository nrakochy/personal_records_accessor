require 'personal_record'

describe PersonalRecord do
  let(:sample_data){ {last_name: "LastName", first_name: "FirstName", gender: "Gender", favorite_color: "FavoriteColor", date_of_birth: "DateOfBirth"} }
  let(:sample_record){ PersonalRecord.new(sample_data) }

  describe '#read_record_attributes' do
    it 'returns the record attributes in a hash' do
      expect(sample_record.read_record_attributes).to eq(sample_data)
    end
  end
end
