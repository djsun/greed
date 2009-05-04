class PriorityDataSource
  def initialize(*sources)
    @sources = sources
  end

  def random_numbers(n)
    @sources.each do |s|
      result = s.random_numbers(n)
      return result if result
    end
    nil
  end
end
