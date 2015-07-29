class KeyGenerator

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def key
    if @key
      @key
    else
      Time.new.strftime("%H%M%S")[0..4]
    end
  end

  def offset
    if @date
      date = @date
    else
      date = Time.new.strftime("%m%d%y")
    end
    date_squared = date.to_i**2
    date_squared.to_s[-4..-1]
  end
end
