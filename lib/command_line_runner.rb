require 'file_parser'
require 'data_record_sorter'
require 'console_presenter'
require 'query_requirements'

class CommandLineRunner

  def initialize(data_files)
    data_records = FileParser.new(data_files).parse_files
    record_sorter = DataRecordSorter.new
    sorted_results = QueryRequirements.new(record_sorter, data_records).sort_by_query_requirements
    ConsolePresenter.new.display_all_sets_of_records(sorted_results)
  end

end

