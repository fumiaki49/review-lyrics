class TalksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @talk = @post.talks.new(talk_params)
    @talk.user_id = current_user.id
    @talk.save
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.json
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:body)
  end
end
