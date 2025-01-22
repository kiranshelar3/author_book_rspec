class AuthorsController < ApplicationController

    def index
		@authors = Author.all
	end

	def show
    	@author = Author.find(params[:id])
    	@books = @author.books
	end

    def new
      @author = Author.new
    end

	def create
		@books = Book.all
		@author = Author.new(author_params)
		book_ids = params[:book_ids] || []
		@author.books = Book.where(id: book_ids)
		if @author.save
			redirect_to author_path(@author), notice: 'Author was successfully created.'
		else
			render :new, status: :unprocessable_entity
		end
	end


    def edit
		@author= Author.find(params[:id])
	end
  
    private
  
    def author_params
      params.require(:author).permit(:first_name, :last_name, :date_of_birth)
    end

end

  