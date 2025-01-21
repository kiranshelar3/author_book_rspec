require 'rails_helper'

RSpec.describe Book, type: :model do
  it "has many authors through book_authors" do
    book = Book.create(title: "Gitanjali")
    author = Author.create(first_name: "Rabindranath", last_name: "Tagore", date_of_birth: "1941-07-08")
    book.authors << author

    expect(book.authors).to include(author)
  end
end
