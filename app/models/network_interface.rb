# OneMDL is a ruby on rails based application designed to collate information
# about IT assets. It is designed to be most useful to System Administrators
# and Service Desk personal.
# 
# Copyright (C) 2013-2015 David Marsh
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

class NetworkInterface < ActiveRecord::Base
  has_paper_trail
  include PublicActivity::Common
  
  # friendly IDs, better URLs
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  # regenerate new slugs?
  def should_generate_new_friendly_id?
    name_changed?
  end
  
  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name,
      # [:name, :network_interface_id]
    ]
  end
  
  before_validation :strip_blanks, :downcase
  
  # belongs to
  belongs_to :network_use
  belongs_to :system
  
  
  
  
  # has many
  
  
  # validations
  validates :name, presence: true
  validates :vlan, presence: true
  validates :ipaddress, presence: true, :ip => { :format => :v4 }
  validates :netmask, presence: true, :ip => { :format => :v4 }
  validates :prefix, presence: true, :ip => { :format => :v4 }
  validates :broadcast, presence: true, :ip => { :format => :v4 }
  validates :gateway, presence: true, :ip => { :format => :v4 }
  validates :network_use, presence: true
  validates :system, presence: true
  
  
  
  
  before_destroy :protect_unknown_none
  
  private
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
    self.name = self.name.strip
  end
  
  def downcase
    self.name = self.name.downcase
  end
  
end
