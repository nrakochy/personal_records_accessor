class MockIO
  attr_accessor :output

  def initialize
    @output = []
  end

  def puts(sample_output)
    @output << sample_output
  end
end
