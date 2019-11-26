class BooksController < ApplicationController
  def top
  
  end
  def show
   @book = Book.new
   @a = Book.find(params[:id])
   @user = @a.user
  end
  def index
    # 本のタイトル全件取得
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def new
        # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
  end

  def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
           redirect_to book_path(@book.id),notice:'successfully'
           # flash[:success] = ''
        else
           @user = current_user
           @books = Book.all
           render :index
        end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'successfully'
      redirect_to book_path(@book.id),notice:'successfully'
    else
      #@book = Book.new
      render :edit
    end
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
