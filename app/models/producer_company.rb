class ProducerCompany < ApplicationRecord
  # has_many :tools
  validates :name, presence: true, uniqueness: true
end
