class FileParser
  attr_reader :files_to_parse

  def initialize(files_to_parse)
    @files_to_parse = files_to_parse
  end

  def read_file(data_file)
    File.open(data_file, "r") do |file|
      file.readlines.map do |line|
        reformat_line(line)
      end
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
