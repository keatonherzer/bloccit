class CommentsController < ApplicationController
  respond_to :html, :js

  def new
    @comment = Comment.new
    
    authorize @comment
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new
    
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post] }
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed"
    else
      flash[:error] = "Could not delete comment. Try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@topic, @post] }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :post_id
    )
  end

end