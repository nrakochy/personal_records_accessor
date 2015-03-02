require 'console_presenter'
require 'personal_record'
require_relative '../support/mock_io'

describe ConsolePresenter do
  let(:mock_io){ MockIO.new }
  let(:presenter){ ConsolePresenter.new(mock_io) }
  let(:record1){ PersonalRecord.new({last_name: "LastName", first_name: "FirstName", gender: "female", favorite_color: "black", date_of_birth: "03/01/1980"}) }
  let(:record1_string){ "LastName FirstName female black 03/01/1980 1980/03/01\n" }
  let(:record2){ PersonalRecord.new({last_name: "sampleLast", first_name: "sampleFirst", gender: "male", favorite_color: "clear", date_of_birth: "01/10/2000"}) }
  let(:record2_string){ "sampleLast sampleFirst male clear 01/10/2000 2000/01/10\n" }
  let(:record3){ PersonalRecord.new({last_name: "Last", first_name: "First", gender: "female", favorite_color: "black", date_of_birth: "04/10/1990"}) }
  let(:record3_string){ "Last First female black 04/10/1990 1990/04/10\n" }
  let(:sample_records_hash_arr){ [record1, record2, record3] }
  let(:sample_records_string_arr){ [record1_string, record2_string, record3_string] }

  describe "#format_individual_record" do
    it "returns a record as a string with a newline from a hash" do
      expect(presenter.format_individual_record(record1)).to eq(record1_string)
      expect(presenter.format_individual_record(record2)).to eq(record2_string)
      expect(presenter.format_individual_record(record3)).to eq(record3_string)
    end
  end

  describe "#format_records" do
    it "returns a single string of record data from multiple hashes" do
      expect(presenter.format_records(sample_records_hash_arr)).to eq(sample_records_string_arr)
    end
  end

  describe "#display_records" do
    it "calls the IO class on the formatted records" do
      expect(presenter.display_records(sample_records_hash_arr).empty?).to eq(false)
    end
  end

end
