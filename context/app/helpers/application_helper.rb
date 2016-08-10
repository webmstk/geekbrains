module ApplicationHelper

  def error_on_field field, object
    error = object.first_error field

    content_tag :div, error, class: "input-form__error" if error
  end

end
