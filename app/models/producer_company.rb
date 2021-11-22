class ProducerCompany < ApplicationRecord
  has_many :tools
  validates :name, presence: true, uniqueness: true

  def self.ordered_by_tools
    self.select("producer_companies.*")
        .select("COUNT(producer_companies.id) as tool_count")
        .left_joins(:tools)
        .group("producer_companies.id")
        .order("tool_count DESC")
  end
end
