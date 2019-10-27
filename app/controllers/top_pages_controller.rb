class TopPagesController < ApplicationController
  def index
    @posts = Post.all.includes(:user)
    @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
  end

  private

  def posts_params
    params.require(:post).permit(:id, :song, :lyric, :comment).merge(user_id: current_user.id)
  end
end
