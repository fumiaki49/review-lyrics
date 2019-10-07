class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to top_pages_path, notice: '投稿が完了しました。'
    end
  end

  private

  def post_params
    params.require(:post).permit(:id, :song, :singer, :lyric, :comment).merge(user_id: current_user.id)
  end
end
