class User < ApplicationRecord
    has_many :categories, foreign_key: 'author_id', dependent: :destroy
    has_many :records, foreign_key: 'author_id', dependent: :destroy
end
