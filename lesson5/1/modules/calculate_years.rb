module CalculateYears
  require 'date'

  def years_old date
    (Date.today - date).to_i / 365
  end
end