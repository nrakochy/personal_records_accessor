require 'json'

module JSONRepository
  class User
    def initialize(params)
      @db_file_path = params[:db_path]
    end

    def find_all_records
      file = File.read(@db_file_path)
      all_records = JSON.parse(file)
      all_records.map{|record| JSON.parse(record) }
    end

    def convert_records_to_json(data_records)
      data_records.map{|record| JSON[record] }.to_json
    end

    def overwrite_data_records_file(data_records)
      formatted_records = convert_records_to_json(data_records)
      File.open(@db_file_path, 'w'){ |file| file.write(formatted_records) }
    end

    def save(data_record)
      formatted_records = find_all_records
      formatted_records << data_record
      formatted_records = formatted_records.to_json
      File.open(@db_file_path, 'w+'){ |file| file.puts(formatted_records) }
      JSON.parse(formatted_records)
    end
  end
end

