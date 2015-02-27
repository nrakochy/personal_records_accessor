require_relative 'console_io'

class ConsolePresenter

  def initialize(io = ConsoleIO.new)
    @io = io
  end

  def display_all_sets_of_records(results)
    output_number = 1
    results.each do |records|
      @io.print_output(output_number)
      display_records(records)
      output_number += 1
    end
  end

  def display_records(records)
    formatted_records = format_records(records)
    @io.print_output(formatted_records)
  end

  def format_records(records)
    records.map{|record| format_individual_record(record) }
  end

  def format_individual_record(record)
    record.values.join(" ") + "\n"
  end

end
