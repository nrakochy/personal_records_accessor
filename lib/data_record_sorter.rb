class DataRecordSorter

  def filter_records(filter_field, filter_query, data_records)
    data_records.select{|record| record.read_record_attributes[filter_field] == filter_query }
  end

  def sort_records_descending(filter_field, records)
    records.sort{|record_hash1, record_hash2| record_hash2.read_record_attributes[filter_field] <=> record_hash1.read_record_attributes[filter_field] }
  end

  def sort_records_ascending(filter_field, records)
    if filter_field == :date_of_birth
      sort_records_ascending_order_by_DOB(records)
    else
      records.sort_by { |record| record.read_record_attributes[filter_field] }
    end
  end

  def sort_records_ascending_order_by_DOB(records)
    records.sort_by{ |record| record.date_year_month_day }
  end
end
