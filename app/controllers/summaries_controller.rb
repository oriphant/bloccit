class SummariesController < ApplicationController

  def new
    @post=Post.find(params[:post_id])
    @summary = Summary.new
    authorize @summary
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:title, :body))

    if @summary.save
      flash[:notice] = "Your summary was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the summary.  Please try again"
      redirect_to [@topic, @post]
    end
  end

  def show
    @topic=Topic.find(params[:topic_id])
    @post=Post.find(params[:id])
    @summary=@post.summary
  end

  def edit
    @topic =Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @summary = Summary.find(params[:id])
    authorize @post
  end

end