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

class Organisation < ActiveRecord::Base
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
      [:name, :full_name]
    ]
  end
  
  before_validation :strip_blanks
  
  # belongs to
  belongs_to :relationship
  
  
  
  
  
  # has many
  has_many :license_types,      dependent: :restrict_with_error
  has_many :licenses,           dependent: :restrict_with_error
  has_many :operating_systems,  dependent: :restrict_with_error
  has_many :systems,            dependent: :restrict_with_error
  has_many :addresses, as: :addressable,         dependent: :restrict_with_error
  # has_many :addresses,             dependent: :restrict_with_error
  has_many :people,             dependent: :restrict_with_error
  
  has_many :notes, as: :noteable
  
  # validations
  validates_format_of :name, :with => /\A[a-zA-Z\d]+\z/, :message => "Can only contain letters and numbers."
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :full_name, presence: true
  validates :relationship_id, presence: true
  
  
  before_destroy :protect_unknown_none
  
  private
  
  def vendor_only
    "#{name} --"
  end
  
  def protect_unknown_none
    !name.downcase.eql?("unknown") and !name.downcase.eql?("none")
  end
  
  protected
  
  def strip_blanks
    self.name = self.name.strip
  end
  
end
