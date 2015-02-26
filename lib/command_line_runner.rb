require 'incoming_records_parser'
require 'data_record_sorter'
require 'console_presenter'
require 'query_requirements'

class CommandLineRunner

  def initialize(data_files)
    @file_parser = IncomingRecordsParser.new
    @record_sorter = DataRecordSorter.new
    @query_requirements = QueryRequirements.new
    @console_presenter = ConsolePresenter.new
  end

  def display_to_console(sorted_results)
    @console_presenter.display_all_sets_of_records(sorted_results)
  end

  def parse_and_sort_records
    data_records = parse_files(data_files)
    sort_records(data_records)
  end

  def parse_files(data_files)
    data_files = {files_to_parse: data_files}
    @file_parser.parse_files(data_files)
  end

  def sort_records(data_records)
    required_query_objects = {data_records: data_records, record_sorter: @record_sorter }
    @query_requirements.sort_by_query_requirements(required_query_objects)
  end

end

