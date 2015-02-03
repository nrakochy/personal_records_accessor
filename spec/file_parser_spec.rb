require 'file_parser'

describe FileParser do
  let(:parser){ FileParser.new(["example_file"]) }
  let(:sample_line_pipes){ "LastName | FirstName | Gender | FavoriteColor | DateOfBirth" }
  let(:sample_line_commas){ "LastName, FirstName, Gender, FavoriteColor, DateOfBirth" }
  let(:sample_line_spaces){ "LastName FirstName Gender FavoriteColor DateOfBirth" }

  describe "#trim_record_line" do
    it 'removes record delimiters and replaces them with a space' do
      expect(parser.trim_record_line(sample_line_pipes)).to eq("LastName   FirstName   Gender   FavoriteColor   DateOfBirth")
      expect(parser.trim_record_line(sample_line_commas)).to eq("LastName  FirstName  Gender  FavoriteColor  DateOfBirth")
    end
  end

  describe "#remove_superfluous_spaces_from_line" do
    it 'removes record delimiters and replaces them with a space' do
      trimmed_pipe_line = parser.trim_record_line(sample_line_pipes)
      trimmed_comma_line = parser.trim_record_line(sample_line_commas)
      expect(parser.remove_superfluous_spaces_from_line(trimmed_pipe_line)).to eq(sample_line_spaces)
      expect(parser.remove_superfluous_spaces_from_line(trimmed_comma_line)).to eq(sample_line_spaces)
    end
  end

end
