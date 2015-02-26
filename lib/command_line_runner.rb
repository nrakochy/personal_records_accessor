require 'incoming_records_parser'
require 'data_record_sorter'
require 'console_presenter'
require 'query_requirements'

class CommandLineRunner

  def initialize(data_files)
    @file_parser = IncomingRecordsParser.new
    @record_sorter = DataRecordSorter.new
    @query_requirements = QueryRequirements.new({ record_sorter: @record_sorter })
    @console_presenter = ConsolePresenter.new
    parse_sort_and_display_records_to_console(data_files)
  end

  def parse_sort_and_display_records_to_console(data_files)
    data_records = parse_files(data_files)
    sorted_records = sort_records(data_records)
    display_to_console(sorted_records)
  end


  def display_to_console(sorted_results)
    @console_presenter.display_all_sets_of_records(sorted_results)
  end

  def parse_files(data_files)
    @file_parser.parse_files(data_files)
  end

  def sort_records(data_records)
    @query_requirements.sort_by_query_requirements(data_records)
  end

end

