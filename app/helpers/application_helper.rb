module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "omdl"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def full_heading(heading)
    base_title = "omdl"
    if :heading.empty?
      base_title
    else
      "#{heading}"
    end
  end
  
  def tr_attributes(tr_status)
    if tr_status == false
      "error"
    end
  end
  
  def sortable(column, title = nil)
    title ||= t(column).humanize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def tab_link(link_text, link_path, link_icon, off_link_state)
    class_name = action_name == link_text ? 'active' : off_link_state
        
    content_tag(:li, :class => class_name, :border => 0) do
      link_to link_path do
        content_tag(:i, "", class: link_icon).html_safe +
        ' ' +
        t(link_text).humanize
      end
    end
  end
  
    def flash_class(level)
      case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
      end
    end
  
  
end
