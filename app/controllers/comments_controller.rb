class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    if params[:commentable_type] == "Experiment"
      @experiment = Experiment.find_by_id(params[:commentable_type])
      @new_comment = Comment.new(comment_params)
      @new_comment.commenter = current_user
      if @new_comment.save
        redirect_to proposal_experiment_path(@experiment.proposal, @experiment)
      else
        @errors = @new_comment.errors
        redirect_to 'new'
      end
    elsif params[:commentable_type] == "Proposal"
      @proposal = Proposal.find_by_id(params[:commentable_type])
      @new_comment = Comment.new(comment_params)
      @new_comment.commenter = current_user
      if @new_comment.save
        redirect_to @proposal
      else
        @errors = @new_comment.errors
        redirect_to 'new'
      end
    end
      404
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id,  :content)
  end

end
