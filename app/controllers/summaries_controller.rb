class SummariesController < ApplicationController
  def index
    @topics = Topic.all
    @posts = Post.all
  end

  def show
  end
end
