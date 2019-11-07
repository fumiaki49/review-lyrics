class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensurer_corrent_user, only: [:destroy]
  protect_from_forgery except: :create

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to top_pages_path, success: '投稿が完了しました。'
    else  
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update 
    @post = Post.find_by(id: params[:id])
    if @post.update(update_post_params)
      redirect_to details_post_path, success: "編集が完了しました"
    else
      render :edit 
    end
  end

  def destroy
    if @post.destroy
      redirect_to my_post_user_path(current_user.id), success: "投稿を削除しました"
    end
  end

  def details
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @like = Like.new
    @talk = Talk.new
    @talks = Talk.where(post_id: @post.id)
  end

  private

  def post_params
    params.require(:post).permit(:id, :song, :singer, :lyric, :comment).merge(user_id: current_user.id)
  end

  def update_post_params
    params.require(:post).permit(:id, :song, :singer, :lyric, :comment)
  end

  def ensurer_corrent_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id == current_user.id
      @post.destroy
    end
  end
end
