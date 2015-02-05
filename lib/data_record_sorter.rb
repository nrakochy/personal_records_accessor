class DataRecordSorter

  def initialize(data_records)
    @data_records = data_records
  end

  def filter_records(filter_field, filter_query)
    @data_records.select{|record| record[filter_field] == filter_query }
  end

  def sort_records_descending(filter_field, records)
    records.sort{|record_hash1, record_hash2| record_hash2[filter_field] <=> record_hash1[filter_field] }
  end

  def sort_records_ascending(filter_field, records)
    records.sort_by { |record| record[filter_field] }
  end

  def sort_records_ascending_order_by_DOB(records)
    modified_records = reverse_date_year_first_on_data_records(records) 
    sorted_records = modified_records.sort_by{ |record| record[:date_of_birth] }
    restore_date_format_on_data_records(sorted_records)
  end

  def reverse_date_year_first_on_data_records(records)
    records.each{|record| record[:date_of_birth] = reformat_date_year_first(record[:date_of_birth]) }
  end

  def restore_date_format_on_data_records(records)
    records.each{|record| record[:date_of_birth] = restore_date_format(record[:date_of_birth]) }
  end

  def reformat_date_year_first(date)
    reversed_date = date.split('/').reverse
    reversed_date[0] + "/" + reversed_date[2] + "/" + reversed_date[1]
  end

  def restore_date_format(reversed_date)
    date_arr = reversed_date.split('/')
    sorted_arr = date_arr << date_arr.shift
    sorted_arr.join('/')
  end
end
