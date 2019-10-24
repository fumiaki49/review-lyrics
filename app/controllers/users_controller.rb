class UsersController < ApplicationController
  def mypages
  end

  def my_post
    @posts = Post.where(user_id: current_user.id)
  end
end
