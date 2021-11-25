class Type < ApplicationRecord
  has_many :tool_types
  has_many :tools, through: :tool_types
  validates :name, presence: true, uniqueness: true
end
