class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def show
    @proposal = Proposal.find_by(id: params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def create
    # switch and test this line once user model/controller is accessible
    # @proposal = current_user.proposals.new(proposal_params)
    @proposal = Proposal.new(proposal_params)

    # hard coding user id for testing, switch when user model/controller is accessible
    @proposal.assign_attributes(proposer_id: 2)
    if @proposal.save
      redirect_to @proposal, notice: 'Proposal was successfully created.'
    else
      render :new
    end
  end

  private
  def proposal_params
    params.require(:proposal).permit(:name, :hypothesis, :target_completion_date)
  end
end
