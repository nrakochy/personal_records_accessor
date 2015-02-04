require 'file_parser'

class Main
  attr_reader :data_files

  def initialize(data_files)
    @data_files = data_files
  end

  def access_records
    FileParser.new(@data_files).parse_files
  end

  def sort_records
  end

end

