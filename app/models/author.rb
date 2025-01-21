class Author < ApplicationRecord
    validates :first_name, presence: true
    validates :date_of_birth, presence: true
    
    has_many :book_authors
    has_many :books, through: :book_authors
end
