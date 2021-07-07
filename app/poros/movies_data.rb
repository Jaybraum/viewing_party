require './app/constants'

class NagerData
  attr_reader :data
  def initialize
    @holidays_data = APIService.connect(Constant::HOLIDAYS_PATH)
  end

  def next_three_holidays
    [@holidays_data[0][:name], @holidays_data[1][:name], @holidays_data[2][:name]]
  end
end