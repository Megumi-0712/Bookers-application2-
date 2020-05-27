class BooksController < ApplicationController

	bofore_action :authenticate_user!,only: [:new,:edit]
	def new
		@book = Book.new
    end
    def create
    	book = Book.new(book_params)
  	    @books = Book.all
		if @book.save
		flash[:notice] = "Book was successfully created."
		redirect_to book_path(Book.last)
  	else
       flash.now[:error]
  		render :index
    end

    def index
    	@books = Book.all
    	@books = Book.new(book_params)
    end
    def show
    	@book = Book.find(params[:id])
      @book = Book.new(book_params)
    end

    def destroy
        book = Book.find(params[:id])
  	    book.destroy
        redirect_to books_path
    end

    private
    def book_params
    	params.require(:book).permit(:title, :body)
    end
end
