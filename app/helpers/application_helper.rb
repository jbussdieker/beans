module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def flash_message(type, message)
    type_class = case type
      when :notice then 'alert-success'
      when :alert then 'alert-warning'
      when :error then 'alert-danger'
    end

    content_tag(:p, message, class: "alert #{type_class}")
  end
end
