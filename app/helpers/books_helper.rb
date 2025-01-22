module BooksHelper
	def books_list
		Book.all.map{ |s| [s.title, s.id] }
	end
end
