module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "onemdl"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def tr_attributes(tr_status)
    if tr_status == false
      "error"
    end
  end
  
  def button_new_path(path)
    path
  end
end


