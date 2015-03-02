require 'json'

module JSONRepository
  class User
    def initialize(params)
      @db_file_path = params[:db_path]
    end

    def add_comma_to_record(data_record)
      data_record + ', '
    end

    def find_all_records
      File.read(@db_file_path)
    end

    def overwrite_data_records_file(data_records)
      File.open(@db_file_path, 'w+') do |file|
        data_records.each_with_index do |record, index|
          formatted_record = record.to_json
          formatted_record = add_comma_to_record(formatted_record) if (index + 1 != data_records.length)
          file.write(formatted_record)
        end
      end
    end

    def save(data_record)
      File.open(@db_file_path, 'a'){ |file| file << data_record.to_json  }
    end
  end
end
