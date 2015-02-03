class FileParser
  attr_reader :files_to_parse

  def initialize(files_to_parse)
    @files_to_parse = files_to_parse
  end

  def read_file(data_file)
    File.open(data_file, "r+") do |file|
      file.readlines.each do |line|
        reformat_line(line)
      end
    end
  end

  def reformat_line(line)
    chomped_line = line.chomp
    trimmed_line = trim_line(chomped_line)
  end

  def trim_line(line)
    line.tr(',|', " ")
  end

end
