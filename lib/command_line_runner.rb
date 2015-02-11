require 'incoming_records_parser'
require 'data_record_sorter'
require 'console_presenter'
require 'query_requirements'

class CommandLineRunner

  def initialize(data_files)
    data_files = {files_to_parse: data_files}
    data_records = IncomingRecordsParser.new(data_files).parse_files
    record_sorter = DataRecordSorter.new
    required_query_objects = {data_records: data_records, record_sorter: record_sorter }
    sorted_results = QueryRequirements.new(required_query_objects).sort_by_query_requirements
    ConsolePresenter.new.display_all_sets_of_records(sorted_results)
  end

end

