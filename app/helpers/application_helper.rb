# OneMDL is a ruby on rails based application designed to collate information
# about IT assets. It is designed to be most useful to System Administrators
# and Service Desk personal.
# 
# Copyright (C) 2013-2014 David Marsh
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = COMPANY_NAME
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def full_heading(heading)
    base_title = COMPANY_NAME
    if :heading.empty?
      base_title
    else
      "#{heading}"
    end
  end
  
  # Returns empty messages for shows and index views
  def empty_msg(plural, singular)
    # start form the last and work in
    if singular.present?
      "Currently no #{t(plural).pluralize.downcase} associated with this #{t(singular).singularize.downcase}"
    elsif plural.present?
      "Currently no #{t(plural).pluralize.downcase}"
    else
      "Currently nothing associated"
    end
  end
  
  def tr_attributes(tr_status)
    if tr_status == false
      "danger"
    end
  end
  
  def tr_environment(environment)
    case environment
      when "Decommissioned" then "danger"
      when "Production" then "active"
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
        content_tag(:span, "", class: link_icon).html_safe +
        ' ' +
        t(link_text).humanize
      end
    end
  end
  
  # flash notice
  def flash_class(level)
    case level
     when 'info' then "alert alert-info"
     when 'success' then "alert alert-success"
     when 'error' then "alert alert-error"
     when 'warn' then "alert"
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
end