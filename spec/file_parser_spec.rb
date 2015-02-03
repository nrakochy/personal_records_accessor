require 'file_parser'

describe FileParser do
  let(:parser){ FileParser.new(["example_file"]) }
  let(:sample_line_pipes){ "LastName | FirstName | Gender | FavoriteColor | DateOfBirth" }
  let(:sample_line_commas){ "LastName, FirstName, Gender, FavoriteColor, DateOfBirth" }

  describe "#trim_line" do
    it 'removes record delimiters and replaces them with a space' do
      expect(parser.trim_line(sample_line_pipes)).to eq("LastName   FirstName   Gender   FavoriteColor   DateOfBirth")
      expect(parser.trim_line(sample_line_commas)).to eq("LastName  FirstName  Gender  FavoriteColor  DateOfBirth")
    end
  end
end
