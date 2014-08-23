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

class System < ActiveRecord::Base
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
      [:name, :system_id]
    ]
  end
  
  before_validation :strip_blanks, :downcase
  
  # belongs to
  belongs_to :device_model
  belongs_to :environment
  belongs_to :organisation
  belongs_to :service_level
  belongs_to :support_level
  belongs_to :operating_system
  belongs_to :licence
  
  # has many
  has_many :network_interfaces, dependent: :restrict_with_error
  has_many :consoles, dependent: :restrict_with_error
  
  # # has many through
  # has_many :network_uses, through: :network_interfaces
  
  # accepts nested
  # accepts_nested_attributes_for :network_interfaces, allow_destroy: true
  
  # validations
  validates :name, presence: true
  validates :device_model_id, presence: true
  validates :environment_id, presence: true
  validates :organisation_id, presence: true
  validates :service_level_id, presence: true
  validates :support_level_id, presence: true
  validates :operating_system_id, presence: true
  
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
