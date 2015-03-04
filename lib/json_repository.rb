require 'json'

module JSONRepository
  class Records
    def initialize(params)
      @db_file_path = params[:db_path]
      @record_constructor = params[:record_constructor]
    end

    def add_new_record_to_all_records(data_record)
      parsed_records = find_all_records
      new_record = unpack_record(data_record)
      parsed_records << new_record
    end

    def find_all_records
      all_records = parse_db_file
      all_records.map{|record| parse_single_record(record) }
    end

    def overwrite_data_records_file(data_records)
      unpacked_records = read_personal_records_data(data_records)
      formatted_records = convert_records_to_json(unpacked_records)
      File.open(@db_file_path, 'w'){ |file| file.write(formatted_records) }
      data_records
    end

    def parse_single_record(record)
      JSON.parse(record, :symbolize_names => true)
    end

    def parse_db_file
      file = File.read(@db_file_path)
      JSON.parse(file)
    end


    def save(data_record)
      updated_record_set = add_new_record_to_all_records(data_record)
      formatted_records = updated_record_set.to_json
      File.open(@db_file_path, 'w'){ |file| file.puts(formatted_records) }
      data_record
    end

    private

    def convert_records_to_json(data_records)
      data_records.map{|record| JSON[record] }.to_json
    end

    def read_personal_records_data(data_records)
      data_records.map{|record| unpack_record(record)  }
    end

    def unpack_record(data_record)
      data_record.read_record_attributes_without_reformatted_date_included
    end
  end
end

