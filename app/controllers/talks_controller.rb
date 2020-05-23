class TalksController < ApplicationController
  before_action :set_post

  def index
    @talk = Talk.new
    @talks = @post.talks.includes(:speaker)
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def create
    @talk = @post.talks.new(talk_params)
    if @talk.save
      respond_to do |format|
        format.html { redirect_to post_talks_path(params[:post_id]) }
        format.json
      end
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:talk).merge(speaker_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
