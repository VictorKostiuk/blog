module ApplicationHelper
  def builds_breadcrumbs(category)
    result = []
    category.ancestors.each do |ancestor|
      result << content_tag(:li, class: "breadcrumb-item") do
        link_to(ancestor.name, ancestor)
      end
    end
    result << content_tag(:li, category.name , class: "breadcrumb-item active")
    result.join('').html_safe
  end

  def user
    user = current_user
  end
  def bootstrap_class_for(name)
    {success: 'alert-success',
     error: 'alert-error',
     danger: 'alert-danger',
     alert: 'alert-warning',
     notice: 'alert-info',
    }[name.to_sym] || name
  end
end
