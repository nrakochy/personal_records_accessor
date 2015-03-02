require 'personal_record'

describe PersonalRecord do
  let(:sample_data){ {last_name: "LastName", first_name: "FirstName", gender: "Gender", favorite_color: "FavoriteColor", date_of_birth: "01/12/1980"} }
  let(:sample_date_reformat){ "1980/01/12" }
  let(:sample_record){ PersonalRecord.new(sample_data) }

  describe "#reformat_date_year_first" do
    it 'returns the YYYY/M/D as a string from a given date string M/DD/YYYY' do
      record_date = sample_data[:date_of_birth]
      expect(sample_record.find_date_year_month_day(record_date)).to eq(sample_date_reformat)
    end
  end

  describe '#read_record_attributes' do
    it 'returns the record attributes in a hash' do
      sample_data[:date_year_month_day] = sample_date_reformat
      expect(sample_record.read_record_attributes).to eq(sample_data)
    end
  end
end
