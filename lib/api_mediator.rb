require 'console_presenter'
require 'data_record_sorter'
require 'endpoint_presenter'
require 'incoming_records_parser'
require 'json_repository'
require 'personal_record'
require 'query_requirements'
require 'record_constructor'

class APIMediator

  def initialize(params = {})
    @data_files = params[:data_files]
    @parser = IncomingRecordsParser.new
    @record_sorter = DataRecordSorter.new
    @record_constructor = RecordConstructor.new
    @repo = RepositoryInterface.for(:records)
    @query_requirements = QueryRequirements.new({ record_sorter: @record_sorter })
    @console_presenter = ConsolePresenter.new
    @endpoint_presenter = EndpointPresenter.new
  end

  def construct_personal_record(data_record)
    @record_constructor.create_personal_record(data_record)
  end

  def build_personal_records(data_records)
    data_records.map{ |record| construct_personal_record(record) }
  end

  def display_to_console(sorted_results)
    @console_presenter.display_all_sets_of_records(sorted_results)
  end

  def get_all_db_records
    all_records = @repo.find_all_records
    @endpoint_presenter.format_http_response(all_records)
  end

  def get_records_sorted_by_query(sort_option)
    all_data = @repo.find_all_records
    records = build_personal_records(all_data)
    results = @record_sorter.sort_records_ascending(sort_option, records)
    formatted_results = read_personal_records_data(results)
    @endpoint_presenter.format_http_response(formatted_results)
  end

  def parse_files(data_files)
    @parser.parse_files(data_files)
  end

  def process_records_and_display_to_console
    records_information = parse_files(@data_files)
    data_records = build_personal_records(records_information)
    save_records(data_records)
    sorted_records = sort_records(data_records)
    display_to_console(sorted_records)
  end

  def read_personal_records_data(data_records)
    data_records.map{|record| record.read_record_attributes_without_reformatted_date_included }
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

