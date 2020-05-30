class Api::TalksController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    last_talk_id = params[:id].to_i
    @talks = post.talks.includes(:speaker).where("id > #{last_talk_id}")
  end
end