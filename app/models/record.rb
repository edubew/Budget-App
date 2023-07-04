class Record < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_and_belongs_to_many :categories, dependent: :destroy

    validates :name, presence: true
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validate :belongs_to_a_category
end
