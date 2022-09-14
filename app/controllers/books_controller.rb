class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] ='book was successfully created'
      redirect_to book_path(@book.id)
    else
       @books = Book.all
       render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] ='book was successfully updated'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
