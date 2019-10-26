class TalksController < ApplicationController
  def create
    @talk = Talk.new(talk_params)
    @talk.user_id = current_user.id
    if @talk.save
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:body)
  end
end