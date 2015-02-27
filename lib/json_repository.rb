require 'json'

module JSONRepository
  class User
    def initialize(params)
      @db_file_path = params[:db_path]
      @io = params[:io]
    end

    def convert_record_format(data_record)
      data_record.to_json
    end

    def find_all_records
      File.read(@db_file_path)
    end

    def model_class
      JSONRepository::User
    end

    def overwrite_data_records_file(data_records)
      File.open(@db_file_path, 'w+') do |f|
        data_records.each do |record|
          formatted_record = record.to_json
          f.write(formatted_record)
        end
      end
    end

    def save(data_record)
      File.open(@db_file_path, 'a') { |file| file << data_record.to_json  }
    end
  end
end
