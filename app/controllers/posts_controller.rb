class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to top_pages_path, notice: '投稿が完了しました。'
    end
  end

  def details
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @like = Like.new
  end

  private

  def post_params
    params.require(:post).permit(:id, :song, :singer, :lyric, :comment).merge(user_id: current_user.id)
  end
end
