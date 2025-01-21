require 'rails_helper'

RSpec.describe Author, type: :model do
  it "is valid with valid attributes" do
    author = Author.new(first_name: "Rabindranath", last_name: "Tagore", date_of_birth: "1941-07-08")
    expect(author).to be_valid
  end

  it "has many books through book_authors" do
    author = Author.create(first_name: "Rabindranath", last_name: "Tagore", date_of_birth: "1941-07-08")
    book = Book.create(title: "Gitanjali")
    author.books << book
    expect(author.books).to include(book)
  end

  it "is invalid without a first name" do
    author = Author.new(last_name: "Rabindranath", date_of_birth: "1941-07-08")
    expect(author).to_not be_valid
  end
  
  it "is invalid without a date of birth" do
    author = Author.new(first_name: "Rabindranath", last_name: "Tagore")
    expect(author).to_not be_valid
  end

end
