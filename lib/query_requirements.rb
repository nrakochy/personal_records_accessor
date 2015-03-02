require_relative '../lib/data_record_sorter'

class QueryRequirements
  attr_reader :sorted_results, :sorter, :data_records

  def initialize(params)
    @sorter = params[:record_sorter]
    @data_records = params[:data_records]
    @sorted_results = []
  end

  def sort_by_query_requirements(data_records = nil)
    @data_records ||= data_records
    @sorted_results << sort_by_gender_then_last_name_ascending
    @sorted_results << sort_by_birthdate_ascending
    @sorted_results << sort_by_last_name_descending
  end

  def sort_by_gender_then_last_name_ascending
    female_records = @sorter.filter_records(:gender, "female", @data_records)
    male_records = @sorter.filter_records(:gender, "male", @data_records)
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
