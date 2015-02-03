class FileParser
  attr_reader :files_to_parse, :formatted_file

  def initialize(files_to_parse)
    @files_to_parse = files_to_parse
    @formatted_file = File.open("formatted_file.txt", "w")
  end

  def parse_and_combine_files
    @files_to_parse.each { |file| reformat_to_single_file(file) }
    @formatted_file.close
  end

  def reformat_to_single_file(data_file)
    File.open(data_file, "r") do |file|
      file.readlines.map{ |line| @formatted_file << reformat_line(line) }
    end
  end

  def reformat_line(line)
    chomped_line = line.chomp
    trimmed_line = trim_line(chomped_line)
    remove_superfluous_spaces(trimmed_line)
  end

  def trim_record_line(line)
    line.tr(',|', " ")
  end

  def remove_superfluous_spaces_from_line(line)
    line.squeeze(" ")
  end

end
