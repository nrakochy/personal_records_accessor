require 'incoming_records_parser'

describe IncomingRecordsParser do
  let(:parser){ IncomingRecordsParser.new }
  let(:unparsed_files){ {files_to_parse: ["example_file"] } }
  let(:sample_line_pipes){ "LastName | FirstName | Gender | FavoriteColor | DateOfBirth" }
  let(:sample_line_commas){ "LastName, FirstName, Gender, FavoriteColor, DateOfBirth" }
  let(:sample_line_spaces){ "LastName FirstName Gender FavoriteColor DateOfBirth" }
  let(:json_post_request){ { :record => sample_line_commas }.to_json }
  let(:formatted_line){ ["LastName", "FirstName", "Gender", "FavoriteColor", "DateOfBirth"] }
  let(:formatted_hash){ {last_name: "LastName", first_name: "FirstName", gender: "Gender", favorite_color: "FavoriteColor", date_of_birth: "DateOfBirth"} }

  describe "#convert_line_to_hash" do
    it 'creates a Hash with data record assigned as values' do
      expect(parser.convert_line_to_hash(formatted_line)).to eq(formatted_hash)
    end
  end

  describe "#parse_JSON_record" do
    it 'converts a JSON record to a Ruby hash with symbolized key' do
      expect(parser.parse_JSON_record(json_post_request)).to eq({record: sample_line_commas})
    end
  end

  describe "#parse_post_request" do
    it 'converts an incoming post request into the db format' do
      expect(parser.parse_post_request(json_post_request)).to eq(formatted_hash)
    end
  end

  describe "#reformat_line" do
    it 'formats an incoming records of supported txt formats and returns a split array format' do
      expect(parser.reformat_line(sample_line_pipes)).to eq(formatted_line)
      expect(parser.reformat_line(sample_line_commas)).to eq(formatted_line)
      expect(parser.reformat_line(sample_line_spaces)).to eq(formatted_line)
    end
  end

describe "#split_line_by_category" do
    it 'removes record delimiters and replaces them with a space' do
      trimmed_pipe_line = parser.trim_record_line(sample_line_pipes)
      trimmed_comma_line = parser.trim_record_line(sample_line_commas)
      expect(parser.split_line_by_category(trimmed_pipe_line)).to eq(formatted_line)
      expect(parser.split_line_by_category(trimmed_comma_line)).to eq(formatted_line)
    end
  end

  describe "#trim_record_line" do
    it 'removes record delimiters and replaces them with a space' do
      expect(parser.trim_record_line(sample_line_pipes)).to eq("LastName   FirstName   Gender   FavoriteColor   DateOfBirth")
      expect(parser.trim_record_line(sample_line_commas)).to eq("LastName  FirstName  Gender  FavoriteColor  DateOfBirth")
    end
  end


end
