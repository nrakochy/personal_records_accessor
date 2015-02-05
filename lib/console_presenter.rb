require 'console_io'

class ConsolePresenter

  def initialize(io = ConsoleIO.new)
    @io = io
  end

  def display_results(results)
    results.each{|records| display_records(records) }
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
