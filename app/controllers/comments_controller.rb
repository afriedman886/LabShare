class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    p params
    p comment_params
    if comment_params[:commentable_type] == "Experiment"
      @experiment = Experiment.find_by_id(comment_params[:commentable_id])
      @new_comment = Comment.new(comment_params)
      @new_comment.commenter = current_user
      if @new_comment.save
        redirect_to proposal_experiment_path(@experiment.proposal, @experiment)
      else
        @errors = @new_comment.errors
        redirect_to 'new'
      end
    elsif comment_params[:commentable_type] == "Proposal"
      @proposal = Proposal.find_by_id(comment_params[:commentable_id])
      @new_comment = Comment.new(comment_params)
      @new_comment.commenter = current_user
      if @new_comment.save
        redirect_to @proposal
      else
        @errors = @new_comment.errors
        redirect_to 'new'
      end
    else
      redirect_to '/'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id,  :content)
  end
end
