class BooksController < ApplicationController
  def index
  end

  def show
  	@book = Book.find(params[id])
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	blog.save
  	redirect_to books_path
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path
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
