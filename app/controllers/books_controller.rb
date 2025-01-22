class BooksController < ApplicationController
	
	def index
        @books = Book.all
  	end

	def show
		@book = Book.find(params[:id])
		@authors = @book.authors
	end

	def new
		@book = Book.new
	end

	def edit
		@book = Book.find(params[:id])		
	end

	def create
		@book = Book.new(book_params)
		if @book.save
		   params['author_ids'].each do |author_id|
		   	@book.book_authors.create(author_id:author_id)
		   end	
			redirect_to @book
		else
			render 'new'
		end
	end

	def create
		@book = Book.new(book_params)
		author_ids = params[:author_ids] || []
		@book.authors = Author.where(id: author_ids)
	  
		if @book.save
		  redirect_to book_path(@book), notice: 'Book was successfully created.'
		else
		  @authors = Author.all
		  render :new, status: :unprocessable_entity
		end
	end
	
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to @book
		else
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title)
	end

end
