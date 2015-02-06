class ConsoleIO

  def initialize(output = $stdout)
    @output = output
  end

  def print_output(output)
    @output.puts(output)
  end

end
