class FileParser
  attr_reader :files_to_parse, :formatted_records

  def initialize(files_to_parse)
    @files_to_parse = files_to_parse
    @formatted_records = []
  end

  def parse_files
    @files_to_parse.each { |file| reformat_data_file(file) }
    @formatted_records
  end

  def reformat_data_file(data_file)
    File.open(data_file, "r") do |file|
      file.readlines.map do |line|
        formatted_line = reformat_line(line)
        @formatted_records << convert_line_to_hash(formatted_line)
      end
    end
  end

  def convert_line_to_hash(params)
     {
     last_name: params[0],
     first_name: params[1],
     gender: params[2],
     favorite_color: params[3],
     date_of_birth: params[4]
    }
  end

  def reformat_line(line)
    chomped_line = line.chomp
    trimmed_line = trim_record_line(chomped_line)
    split_line_by_category(trimmed_line)
  end

  def trim_record_line(line)
    line.tr(',|', " ")
  end

  def split_line_by_category(line)
    line.split(" ")
  end

end
