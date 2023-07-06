class Category < ApplicationRecord
    self.table_name = 'categories'
    belongs_to :author, class_name: 'User'
    has_and_belongs_to_many :records, dependent: :destroy

    validates :name, presence: true
    validates :icon, presence: true

    def total_amount
        records.sum(:amount)
    end
end
