class UsersController < ApplicationController
  def new
    if params[:back]
      @user = User.new(user_params)
    else
      @user = User.new
    end
  end
  
  def create
  @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
      
    else
      render 'new'
    end
  end
  
  def show
     @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end
   
  def destroy
    @user.destroy
      redirect_to users_path, notice:"削除しました！"
  end
  
  
  private
  
    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end
  
end
