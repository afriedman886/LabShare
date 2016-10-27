class ExperimentsController < ApplicationController
  before_filter :user_logged_in?

  def new
    @proposal = Proposal.find_by_id(params[:proposal_id])
    @experiment = Experiment.new
  end

  def show
    @experiment = Experiment.find_by_id(params[:id])
  end

  def edit
    @experiment = Experiment.find_by_id(params[:id])
  end

  def create
    @proposal = Proposal.find_by_id(params[:proposal_id])
    @experiment = @proposal.experiments.new(experiment_params)
    @experiment.assign_attributes(experimenter_id: current_user.id)

    if @experiment.save
      redirect_to proposal_experiment_path(@experiment.proposal, @experiment), notice: 'Experiment was successfully created.'
    else
      render :new
    end
  end

  def update
    @experiment = Experiment.find_by_id(params[:id])

    if @experiment.update(experiment_params)
      redirect_to proposal_experiment_path(@experiment.proposal, @experiment)
    end
  end

  private
  def experiment_params
    params.require(:experiment).permit(:procedure, :materials, :status, :conclusion)
  end

  def user_logged_in?
    if session[:user_id] != nil
    else
      redirect_to new_session_path
    end
  end

end
