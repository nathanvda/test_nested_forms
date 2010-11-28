module ApplicationHelper

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, '#', :class => "remove_fields")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    hidden_div = content_tag('div', :id => "task_fields_template", :style => "display:none;") do
      f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
        render(association.to_s.singularize + "_fields", :f => builder)
      end
    end
    hidden_div + link_to(name, '#', :class => 'add_fields', :'data-association' => association.to_s.singularize)
  end

end
