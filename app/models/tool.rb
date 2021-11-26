class Tool < ApplicationRecord
  has_one_attached :image
  belongs_to :producer_company
  has_many :tool_types
  has_many :tools, through: :tool_types

  validates :name, :description, :price, :quantity, presence: true
  validates :name, uniqueness: true
  validates :price, :quantity, numericality: true
end
