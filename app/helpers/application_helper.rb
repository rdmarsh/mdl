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
  
  def tr_environment(environment)
    case environment
      when "Decommissioned" then "error"
      when "Production" then "success"
      when "Development" then "info"
      when "UAT" then "warning"
      when "Pre-production" then "warning"
      when "Disaster recovery" then "success"
      when "Development" then "warning"
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
  
  # flash notice
  def flash_class(level)
    case level
     when :info then "alert alert-info"
     when :success then "alert alert-success"
     when :error then "alert alert-error"
     when :warn then "alert"
    end
  end
  
  # gravatar avatar helper, from railscasts ep 244
  def avatar_url(user)
    size=48
    
    if user.avatar_url.present?
      user.avatar_url
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=wavatar"
    end
  end
  
  # from railscasts 207
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      filter_html: true,
      no_images: true,
      no_styles: true,
      safe_links_only: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      strikethrough: true,
      superscript: true,
      highlight: true,
      underline: true,
    }
    preserve(Redcarpet::Markdown.new(renderer, options).render(text).html_safe)
  end
end