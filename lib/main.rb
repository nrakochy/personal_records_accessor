require 'file_parser'
require 'data_record_sorter'
require 'console_presenter'

class Main
  attr_reader :data_files, :data_records, :output_presenter, :sorted_results

  def initialize(data_files)
    @data_records = access_records(data_files)
    @sorter = DataRecordSorter.new(@data_records)
    @sorted_results = []
    @output_presenter = ConsolePresenter.new
  end

  def access_records(files)
    FileParser.new(files).parse_files
  end

  def display_request_queries
    requested_query_outputs
    @output_presenter.display_results(@sorted_results)
  end

  def requested_query_outputs
    @sorted_results << sort_by_gender_then_last_name_ascending
    @sorted_results << sort_by_birthdate_ascending
    @sorted_results << sort_by_last_name_descending
  end

  def sort_by_gender_then_last_name_ascending
    female_records = @sorter.filter_records(:gender, "female")
    male_records = @sorter.filter_records(:gender, "male")
    sorted_female_records = @sorter.sort_records_ascending(:last_name, female_records)
    sorted_male_records = @sorter.sort_records_ascending(:last_name, male_records)
    sorted_female_records + sorted_male_records
  end

  def sort_by_birthdate_ascending
    @sorter.sort_records_ascending(:date_of_birth, @data_records)
  end

  def sort_by_last_name_descending
    @sorter.sort_records_descending(:last_name, @data_records)
  end

end

