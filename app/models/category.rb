class Category < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_and_belongs_to_many :records, dependent: :destroy

    validates :name, presence: true
    validates :icon, presence: true
end
