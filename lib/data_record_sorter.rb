class DataRecordSorter

  def initialize(data_records)
    @data_records = data_records
  end

  def filter_records(filter_field, filter_query)
    field = filter_field.to_sym
    @data_records.select{|record| record[field] == filter_query }
  end

  def sort_records_descending(filter_field, records)
    filter = filter_field.to_sym
    records.sort{|record_hash1, record_hash2| record_hash2[filter] <=> record_hash1[filter] }
  end


end
