class Tool < ApplicationRecord
  belongs_to :producer_company
  validates :name, :description, :price, :quantity, presence: true
  validates :name, uniqueness: true
  validates :price, :quantity, numericality: true
end
