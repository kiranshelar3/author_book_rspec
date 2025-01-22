# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data

BookAuthor.destroy_all
Author.destroy_all
Book.destroy_all

# Create authors
authors = []
20.times do |i|
  authors << Author.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.between(from: '1950-01-01', to: '2000-12-31')
  )
end

puts "Created #{authors.count} authors."

# Create books
books = []
20.times do |i|
  books << Book.create!(
    title: Faker::Book.title
  )
end

puts "Created #{books.count} books."

# Create book-author relationships
books.each do |book|
  # Assign between 1 and 5 random authors to each book
  authors_sample = authors.sample(rand(1..5))
  book.authors << authors_sample
end

puts "Assigned authors to books."
