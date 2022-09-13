class BooksController < ApplicationController
  def new
  end

  def create
    @books = Book.new(book_params)
    @books.save
    redirect_to book_path(@books.id)
  end

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    @books.update(book_params)
    redirect_to book_path(@books.id)
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to '/books'
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
