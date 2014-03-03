module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title.to_s }
  end

  def flash_message(type, message)
    type_class = case type
      when :notice then 'alert-success'
      when :alert then 'alert-warning'
      when :error then 'alert-danger'
    end

    content_tag(:p, message, class: "alert #{type_class}")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => 'btn btn-sm btn-primary')
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class => 'btn btn-sm btn-danger')
  end
end
