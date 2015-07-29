module TodayValues

  def today_key
    Time.now.strftime("%H%M%S")[0..4]
  end

  def today_date
    Time.new.strftime("%m%d%y")
  end

end
