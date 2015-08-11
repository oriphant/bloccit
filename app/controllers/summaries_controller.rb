class SummariesController < ApplicationController

  def show
    @topic=Topic.find(params[:topic_id])
    @post=Post.find(params[:id])
    @summary=@post.summary

  end

  def create
  @topic =Topic.find(params[:topic_id])
  @post = current_user.posts.build(params.require(:post).permit(:title, :body))
  @summary = current_user.summaries.build(params.require(:summary).permit(:title, :body))
  @post.topic = @topic


  if @summary.save
    flash[:notice] = "Your summary was saved."
    redirect_to [@topic, @post, @summary]
  else
    flash[:error] = "There was an error saving the summary.  Please try again"
    redirect_to [@topic, @post, @summary]
  end
end

end