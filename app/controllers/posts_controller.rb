class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensurer_corrent_user, only: [:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to top_pages_path, notice: '投稿が完了しました。'
    end
  end

  def destroy
    if @post.destroy
      redirect_to my_post_user_path(current_user.id)
      flash[:notice] = "投稿を削除しました"
    end
  end

  def details
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @like = Like.new
    @talk = Talk.new
  end

  private

  def post_params
    params.require(:post).permit(:id, :song, :singer, :lyric, :comment).merge(user_id: current_user.id)
  end

  def ensurer_corrent_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id == current_user.id
      @post.destroy
    end
  end
end
