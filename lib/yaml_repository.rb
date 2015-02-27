require 'yaml'
require 'json'

module YAMLRepository
  class User
    def initialize(params)
      @yaml_file_path = params[:db_path]
    end

    def convert_json(record)
      JSON.parse(record)
    end

    def convert_record_to_yaml(data_record)
      data_record = convert_json(data_record) if data_record.class == JSON
      data_record.to_yaml
    end

    def find_all_records
      YAML.load_file(@yaml_file_path)
    end

    def model_class
      YAMLRepository::User
    end

    def overwrite_data_records_file(data_records)
      File.open(@yaml_file_path, 'w+') do |f|
        data_records.map do |record|
          formatted_record = convert_record_to_yaml(record)
          f.write(formatted_record)
        end
      end
    end

    def save(data_record)
      formatted_record = convert_record_to_yaml(data_record)
      File.open(@yaml_file_path, 'w') { |file| YAML.dump(formatted_record, file) }
    end
  end
end
