class SimulatedData
  def initialize(data_source)
    @data_source = data_source
  end

  def random_numbers(n)
    numbers = @data_source.shift
    if numbers
      numbers[0...n]
    else
      nil
    end
  end
end
