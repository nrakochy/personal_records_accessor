class ConsoleIO

  def initialize(input = $stdin, output = $stdout)
    @output = output
  end

  def print_output(output)
    @output.puts(output)
  end

end
