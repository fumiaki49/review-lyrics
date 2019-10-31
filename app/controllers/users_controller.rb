class UsersController < ApplicationController
  def mypages
  end

  def my_post
    @posts = Post.where(user_id: current_user.id)
  end

  def my_favorit
    @likes = current_user.liked_posts
  end
end
