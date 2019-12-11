class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show #ok
    @book = Book.find(params[:id])
  end
  
  def new #ok
  end
  
  def create #ok
  	@book = Book.new(book_params)
    @books = Book.all
  	 if @book.save
      redirect_to book_path(@book),notice: "You're successfully"
    else
      render "index"
    end

  end
  
  def edit #ok
  	@book = Book.find(params[:id])
  end
  
  def update #ok
  	@book = Book.find(params[:id])
  	@book.update(book_params)
  	redirect_to book_path(@book),notice: "You're successfully"
  end
  
  def destroy #ok
  	book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
