# OneMDL is a ruby on rails based application designed to collate information
# about IT assets. It is designed to be most useful to System Administrators
# and Service Desk personal.
# 
# Copyright (C) 2013 David Marsh
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

class License < ActiveRecord::Base
  include PublicActivity::Common
  
  # friendly IDs, better URLs
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  # regenerate new slugs?
  def should_generate_new_friendly_id?
    organisation_id_changed?
  end
  
  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      [:organisation_id, :license_type_id],
      [:organisation_id, :license_type_id, :id]
    ]
   end
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :license_type
  belongs_to :organisation
  
  
  
  
  # has many
  has_many :systems, dependent: :restrict_with_error
  
  # # has many through
  # has_many :network_uses, through: :network_interfaces
  
  # accepts nested
  # accepts_nested_attributes_for :network_interfaces, allow_destroy: true
  
  # validations
  validates :organisation_id, presence: true
  validates :license_type_id, presence: true
  validates :key, presence: true
  validates :quantity, presence: true
  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 0
  
  
  
  before_destroy :protect_unknown_none
  
  private
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
     self.quantity = self.quantity.strip
  end
  
end
