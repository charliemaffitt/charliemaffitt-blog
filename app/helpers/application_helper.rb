module ApplicationHelper
  def show_form_errors(model)
    error_messages = model.errors.full_messages.map do |message|
      content_tag(:p, message)
    end
    if error_messages.any?
      content_tag(:div, class: 'alert alert-warning form-errors') do
        content_tag(:div, error_messages.join.html_safe, :class => 'alert-body')
      end
    end
  end

  def bootstrap_class_for_alert(name)
    css_class = ["alert", "alert-dismissible"]
    if ["success", "notice"].include? name
      css_class << "alert-success"
    elsif ["error", "alert"].include? name
      css_class << "alert-danger"
    end
    css_class.join(" ")
  end
end
