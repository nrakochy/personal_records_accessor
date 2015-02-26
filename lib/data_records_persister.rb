require 'yaml'

class DataRecordsPersister

  def overwrite_data_records_file
  end

  def load_records(records_file_path)
    YAML.load_file(records_file_path)
  end

  def add_new_record(data_record, records_file_path)
      updated_record = data_record.to_yaml
      File.open(records_file_path, 'w') { |f| YAML.dump(updated_record, f) }
  end
end
