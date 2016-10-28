class ObservationsController < ApplicationController

  def new
    @observation = Observation.new
  end

  def create
    @experiment = Experiment.find_by_id(observation_params[:experiment_id])
    @new_observation = Observation.new(observation_params)
    @new_observation.save
    redirect_to proposal_experiment_path(@experiment.proposal, @experiment)
  end

  private
  def observation_params
    params.require(:observation).permit(:experiment_id, :content)
  end
end
