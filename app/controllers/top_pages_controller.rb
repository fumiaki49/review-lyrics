class TopPagesController < ApplicationController
  def index
    @posts = Post.all.includes(:user)
  end

  private

  def posts_params
    params.require(:post).permit(:id, :song, :lyric, :comment).merge(user_id: current_user.id)
  end
end
