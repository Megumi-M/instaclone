class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:index, :new, :edit, :show, :destroy]
  
  def index
    @pictures = Picture.all
  end
    
  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end
  
  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id 
      if @picture.save
        redirect_to picture_path(@picture.id), notice:"投稿しました！"
        #PictureMailer.picture_mail(@picture).deliver
      else
        render "new"
      end
  end
  
  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id 
      if @picture.invalid? 
        render 'new'
      end
  end
  
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end
  
  def edit
  end
  
  def update
    if @picture.update(picture_params)
      redirect_to pictures_path
    else
      render 'edit'
    end
  end
   
  def destroy
    @picture.destroy
      redirect_to pictures_path, notice:"削除しました！"
  end
  
  private
  def picture_params
  params.require(:picture).permit(:content, :image, :image_cache)
  end
    
  def set_picture
  @picture = Picture.find(params[:id])
  end
  
  def check_user
    unless logged_in?
      redirect_to new_session_path
    end
  end
  
end
