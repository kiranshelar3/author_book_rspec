require 'rails_helper'

RSpec.describe Author, type: :model do
  it "has many books through book_authors" do
    author = Author.create(first_name: "Rabindranath", last_name: "Tagore", date_of_birth: "1941-07-08")
    book = Book.create(title: "Gitanjali")
    author.books << book

    expect(author.books).to include(book)
  end
end
