class Category < ApplicationRecord
  self.table_name = 'categories'
  has_and_belongs_to_many :records

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    records.sum(:amount)
  end
end
