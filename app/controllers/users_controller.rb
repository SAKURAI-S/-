class UsersController < ApplicationController
  def top

  end
  def show
  	@user = User.find(params[:id]) # ここを記述
    @book = Book.new
    @books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user.id)
    end


  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id),notice:'successfully'
       # flash[:success] = 'successfully'
    else
       # @user =  User.find(params[:id])
       @books = @user.books.all
       @book = Book.new
       render :edit
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  
  end
private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
