class KeyGenerator

  attr_accessor :key

  def input_time
    t = Time.new
    t = t.strftime("%H%M%S")
  end

  def generate_key(key = input_time[0..4])
    @key = key
  end

  def input_date
    t = Time.new
    t = t.strftime("%m%d%y")
  end

  def generate_date_squared
    input_date.to_i**2
  end

  def generate_offset
    generate_date_squared.to_s[-4..-1]
  end

end
