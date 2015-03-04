require 'console_presenter'
require 'data_record_sorter'
require 'endpoint_presenter'
require 'incoming_records_parser'
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
    @console_query_requirements = QueryRequirements.new({ record_sorter: @record_sorter })
    @console_presenter = ConsolePresenter.new
    @endpoint_presenter = EndpointPresenter.new
  end

  def build_personal_records(data_records)
    data_records.map{ |record| construct_personal_record(record) }
  end

  def get_all_db_records
    all_records = find_all_records
    present_results_to_endpoint(all_records)
  end

  def get_records_sorted_by_query(sort_option)
    all_data = find_all_records
    records = build_personal_records(all_data)
    results = sort_records_by_param(sort_option, records)
    formatted_results = read_personal_records_data(results)
    present_results_to_endpoint(formatted_results)
  end

  def process_records_and_display_to_console
    records_information = parse_files(@data_files)
    data_records = build_personal_records(records_information)
    save_new_records(data_records)
    sorted_records = sort_records_acc_to_query_requirements(data_records)
    display_to_console(sorted_records)
  end

  def save_new_records(data_records)
    query_field = :last_name
    sorted_records = sort_records_by_param(query_field, data_records)
    save_records(sorted_records)
  end

  def save_posted_record(data)
    parsed_data = parse_post_request(data)
    record = construct_personal_record(parsed_data)
    saved_record = save_record(record)
    unpacked_record = read_record_data(saved_record)
    present_results_to_endpoint(unpacked_record)
  end

  private

  def construct_personal_record(data_record)
    @record_constructor.create_personal_record(data_record)
  end

  def display_to_console(sorted_results)
    @console_presenter.display_all_sets_of_records(sorted_results)
  end

  def find_all_records
    @repo.find_all_records
  end

  def present_results_to_endpoint(results)
    @endpoint_presenter.format_http_response(results)
  end

  def parse_post_request(data)
    @parser.parse_post_request(data)
  end

  def parse_files(data_files)
    @parser.parse_files(data_files)
  end

  def read_record_data(data_record)
    data_record.read_record_attributes_without_reformatted_date_included
  end

  def read_personal_records_data(data_records)
    data_records.map{|record| read_record_data(record) }
  end

  def save_record(data_record)
    @repo.save(data_record)
  end

  def save_records(data_records)
    @repo.overwrite_data_records_file(data_records)
  end

  def sort_records_acc_to_query_requirements(data_records)
    @console_query_requirements.sort_by_query_requirements(data_records)
  end

  def sort_records_by_param(param, data_records)
    @record_sorter.sort_records_ascending(param, data_records)
  end
end

