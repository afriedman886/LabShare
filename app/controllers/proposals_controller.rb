class ProposalsController < ApplicationController
  before_filter :user_logged_in?

  def homeindex
    @proposals = Proposal.recent
  end

  def index
    @proposals = Proposal.all
  end

  def show
    @proposal = Proposal.find_by(id: params[:id])
  end

  def new
    @proposal = Proposal.new
    if request.xhr?
      render :"/proposals/_form", layout: false
    end
  end

  def edit
    @proposal = Proposal.find_by_id(params[:id])
    if current_user != @proposal.proposer || @proposal.status == 'Closed'
      redirect_to @proposal
    end
  end

  def create
    @proposal = current_user.proposals.new(proposal_params)

    if @proposal.save
      if request.xhr?
        render :"/proposals/_proposal", layout: false, locals: { proposal: @proposal }
      else
        redirect_to @proposal, notice: 'Proposal was successfully created.'
      end
    else
      if request.xhr?
        render :"_errors", layout: false, locals: { errors: @errors }
      else
        render :new
      end
    end
  end

  def update
    @proposal = Proposal.find_by_id(params[:id])

    if @proposal.update(proposal_params)
      redirect_to @proposal
    else
      render 'edit'
    end
  end

  private
  def user_logged_in?
    if session[:user_id] != nil
    else
      redirect_to new_session_path
    end
  end

  def proposal_params
    params.require(:proposal).permit(:name, :hypothesis, :target_completion_date, :status)
  end
end
