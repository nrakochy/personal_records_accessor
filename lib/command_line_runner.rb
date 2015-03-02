require 'console_presenter'
require 'data_record_sorter'
require 'incoming_records_parser'
require 'json_repository'
require 'personal_record'
require 'query_requirements'

class CommandLineRunner

  def initialize(data_files, database_path)
    @file_parser = IncomingRecordsParser.new
    @record_sorter = DataRecordSorter.new
    @repo = JSONRepository::User.new(database_path)
    @query_requirements = QueryRequirements.new({ record_sorter: @record_sorter })
    @console_presenter = ConsolePresenter.new
    process_records_and_display_to_console(data_files)
  end

  def construct_personal_record(data_record)
    PersonalRecord.new(data_record)
  end

  def build_personal_records(data_records)
    data_records.map{ |record| construct_personal_record(record) }
  end

  def display_to_console(sorted_results)
    @console_presenter.display_all_sets_of_records(sorted_results)
  end

  def parse_files(data_files)
    @file_parser.parse_files(data_files)
  end

  def process_records_and_display_to_console(data_files)
    records_information = parse_files(data_files)
    data_records = build_personal_records(records_information)
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

