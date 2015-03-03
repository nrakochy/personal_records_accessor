require 'endpoint_presenter'

describe ConsolePresenter do
  let(:record1_string){ "LastName FirstName female black 03/01/1980\n" }
  let(:record2){ PersonalRecord.new({last_name: "sampleLast", first_name: "sampleFirst", gender: "male", favorite_color: "clear", date_of_birth: "01/10/2000"}) }
  let(:record2_string){ "sampleLast sampleFirst male clear 01/10/2000\n" }
  let(:record3){ PersonalRecord.new({last_name: "Last", first_name: "First", gender: "female", favorite_color: "black", date_of_birth: "04/10/1990"}) }
  let(:record3_string){ "Last First female black 04/10/1990\n" }
  let(:sample_records_hash_arr){ [record1, record2, record3] }
  let(:sample_records_string_arr){ [record1_string, record2_string, record3_string] }

  describe "#format_individual_record" do
    it "returns a record as a string with a newline from a hash" do
    end
  end

  describe "#format_records" do
    it "returns a single string of record data from multiple hashes" do
    end
  end

  describe "#display_records" do
    it "calls the IO class on the formatted records" do
    end
  end

end
