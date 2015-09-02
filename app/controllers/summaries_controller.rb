class SummariesController < ApplicationController

  def show
    @topic=Topic.find(params[:topic_id])
    @post=Post.find(params[:id])
    @summary=@post.summary
  end

  def new
    @post=Post.find(params[:post_id])
    @summary = Summary.new
    authorize @summary
  end

  def create
    @topic =Topic.find(params[:topic_id])
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
  
  def update
    @topic =Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary

    if @summary.update_attributes(params.require(:summary).permit(:title, :body))
      flash[:notice] = "Your summary was updated."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error updating the summary.  Please try again"
      redirect_to [@post.topic, @post]
    end
  end

  def edit
    @topic =Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @post
  end

end