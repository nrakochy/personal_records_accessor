require 'json'

module JSONRepository
  class Records
    def initialize(params)
      @db_file_path = params[:db_path]
    end

    def find_all_records
      file = File.read(@db_file_path)
      all_records = JSON.parse(file)
      all_records.map{|record| JSON.parse(record, :symbolize_names => true) }
    end

    def overwrite_data_records_file(data_records)
      unpacked_records = unpack_personal_records(data_records)
      formatted_records = convert_records_to_json(unpacked_records)
      File.open(@db_file_path, 'w'){ |file| file.write(formatted_records) }
      data_records
    end

    def save(data_record)
      formatted_records = find_all_records
      new_record = unpack_record(data_record)
      formatted_records << new_record
      formatted_records = formatted_records.to_json
      File.open(@db_file_path, 'w'){ |file| file.puts(formatted_records) }
      data_record
    end

  private

    def convert_records_to_json(data_records)
      data_records.map{|record| JSON[record] }.to_json
    end

    def unpack_personal_records(data_records)
      data_records.map{|record| unpack_record(record)  }
    end

    def unpack_record(data_record)
      data_record.read_record_attributes_without_reformatted_date_included
    end
  end
end

