class MockIO
  attr_accessor :output

  def initialize
    @output = []
  end

  def print_output(sample_output)
    @output << sample_output
  end
end
