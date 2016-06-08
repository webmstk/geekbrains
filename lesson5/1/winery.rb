require_relative 'modules/calculate_years'

class Winery
  include CalculateYears

  def initialize title, date_of_foundation
    @title = title
    @date_of_foundation = Date.parse date_of_foundation
  end

  def years_old
    super @date_of_foundation
  end
end