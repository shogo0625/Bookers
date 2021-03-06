class BooksController < ApplicationController
	def index
		@user = current_user
		@books = Book.all.order(id: :desc)
		@book = Book.new
	end

	def create
		@user = current_user
		@books = Book.all
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have created book successfully."
			redirect_to book_path(@book)
		else
			render 'index'
		end
	end

	def show
		@books = Book.all
		@book = Book.new
		@book_detail = Book.find(params[:id])
		@user = @book_detail.user
	end

	def edit
		@book = Book.find(params[:id])
	    if @book.user_id != current_user.id
	      redirect_to books_path
	    else
	      render 'edit'
	    end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to book_path(@book)
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
		params.require(:book).permit(:title, :body)
	end
end
