class BooksController < ApplicationController
	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def create
		user = current_user
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path(@book)
	end

	def show
		@book = Book.find(params[:id])
		@user = current_user
	end

	def edit
	end

	def update
	end

	def delete
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
