require 'json'

class IncomingRecordsParser
  attr_reader :formatted_records

  def initialize
    @formatted_records = []
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

  def parse_files(unparsed_files)
    unparsed_files.each { |file| reformat_data_file(file) }
    @formatted_records
  end

  def parse_post_request(data_record)
    parsed_record = parse_JSON_record(data_record)
    posted_data = parsed_record[:record]
    reformat_line_and_convert_to_hash(posted_data)
  end

  def parse_JSON_record(record)
    JSON.parse(record, :symbolize_names => true)
  end

  def reformat_data_file(data_file)
    File.open(data_file, "r") do |file|
      file.readlines.map{ |line| @formatted_records << reformat_line_and_convert_to_hash(line) }
    end
  end

  def reformat_line_and_convert_to_hash(line)
    reformatted_line = reformat_line(line)
    convert_line_to_hash(reformatted_line)
  end

  def reformat_line(line)
    chomped_line = line.chomp
    trimmed_line = trim_record_line(chomped_line)
    split_line_by_category(trimmed_line)
  end

  def split_line_by_category(line)
    line.split(" ")
  end

  def trim_record_line(line)
    line.tr(',|', " ")
  end
end
