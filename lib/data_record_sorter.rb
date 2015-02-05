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
    modified_records.sort_by{ |record| record[:date_of_birth] }
  end

  def reverse_date_on_data_records(records)
    records.each{|record| record[:date_of_birth] = reverse_split_date(record[:date_of_birth]) }
  end

  def reverse_split_date(date)
    date.split('/').reverse.join('/')
  end
end
