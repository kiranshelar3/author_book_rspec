module AuthorsHelper
	def authors_list
		Author.all.map{ |s| [s.first_name + " "+ s.last_name, s.id] }
	end
end
