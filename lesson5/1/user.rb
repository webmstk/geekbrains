require_relative 'modules/calculate_years'

class User
  include CalculateYears

  def initialize name, date_of_birth
    @name = name
    @date_of_birth = Date.parse date_of_birth
  end

  def years_old
    super @date_of_birth
  end
end