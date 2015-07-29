class Generator

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def key
    @key || Time.new.strftime("%H%M%S")[0..4]
  end

  def date
    @date || Time.new.strftime("%m%d%y")
  end

  def offset
    date_squared = date.to_i**2
    date_squared.to_s[-4..-1]
  end

end
