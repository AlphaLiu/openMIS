# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  display_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Role < ActiveRecord::Base
  has_many :users
  attr_accessible :display_name, :name

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :display_name, presence: true, length: { maximum: 50 }
end
