require 'incoming_records_parser'
require 'json_repository'
require 'data_record_sorter'
require 'console_presenter'
require 'query_requirements'

class CommandLineRunner

  def initialize(data_files)
    @file_parser = IncomingRecordsParser.new
    @record_sorter = DataRecordSorter.new
    database_path = { db_path: 'database.json' }
    @repo = JSONRepository::User.new(database_path)
    @query_requirements = QueryRequirements.new({ record_sorter: @record_sorter })
    @console_presenter = ConsolePresenter.new
    process_records_and_display_to_console(data_files)
  end

  def display_to_console(sorted_results)
    @console_presenter.display_all_sets_of_records(sorted_results)
  end

  def parse_files(data_files)
    @file_parser.parse_files(data_files)
  end

  def process_records_and_display_to_console(data_files)
    data_records = parse_files(data_files)
    save_records(data_records)
    sorted_records = sort_records(data_records)
    display_to_console(sorted_records)
  end

  def save_records(data_records)
    query_field = :last_name
    sorted_records = @record_sorter.sort_records_ascending(query_field, data_records)
    @repo.overwrite_data_records_file(sorted_records)
  end

  def sort_records(data_records)
    @query_requirements.sort_by_query_requirements(data_records)
  end

end

