require 'rails_helper'

RSpec.describe BookAuthor, type: :model do
  it "is valid with valid attributes" do
    author = Author.create(first_name: "Rabindranath", last_name: "Tagore", date_of_birth: "1941-07-08")
    book = Book.create(title: "Gitanjalli")
    book_author = BookAuthor.new(author: author, book: book)
    expect(book_author).to be_valid
  end
end
