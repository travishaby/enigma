class KeyGenerator

  def initialize(key = nil, date = nil)
    @key = key
    @date = date
  end

  def input_time
    t = Time.new
    t = t.strftime("%H%M%S")
  end

  def generate_key
    if @key == nil
      @key = input_time[0..4]
    else
      @key
    end
    @key
  end

  def input_date
    t = Time.new
    t = t.strftime("%m%d%y")
  end

  def generate_date_squared
    if @date == nil
      @date = input_date
    end
    @date.to_i**2
  end

  def generate_offset
    generate_date_squared.to_s[-4..-1]
  end

end
