class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def first_error field
    errors[field].first
  end
end
