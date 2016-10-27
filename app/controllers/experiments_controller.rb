class ExperimentsController < ApplicationController

  def new
    @proposal = Proposal.find_by_id(params[:proposal_id])
    @experiment = Experiment.new
    if @proposal.status == 'Closed'
      redirect_to proposal_path(@proposal)
    end
  end

  def show
    @experiment = Experiment.find_by_id(params[:id])
  end

  def edit
    @experiment = Experiment.find_by_id(params[:id])
    if current_user != @experiment.experimenter || @experiment.status == 'Closed'
      redirect_to proposal_experiment_path(@experiment.proposal, @experiment)
    end
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

end
