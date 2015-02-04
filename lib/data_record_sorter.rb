class DataRecordSorter

  def initialize(data_records)
    @data_records = data_records
  end

  def filter_record(filter_field, filter_query)
    field = filter_field.to_sym
    @data_records.select{|record| record[field] == filter_query }
  end

end
