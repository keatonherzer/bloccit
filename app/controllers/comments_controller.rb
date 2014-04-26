class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    
    authorize @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])

    authorize @comment

    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved successfully."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
end
