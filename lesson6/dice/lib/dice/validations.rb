module Validations
  def validate_presence value
    raise 'no value given' unless value
  end

  def validate_maximum value, max
    raise "value can't be more than #{max}" if value > max
  end
end
