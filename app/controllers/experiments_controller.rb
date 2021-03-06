class ExperimentsController < ApplicationController
  before_filter :user_logged_in?, :redirect_cancel, only: [:create, :update, :show]

  def new
    @proposal = Proposal.find_by_id(params[:proposal_id])
    @experiment = Experiment.new
    if request.xhr?
      if @proposal.status == 'Closed'
        redirect_to proposal_path(@proposal)
      else
        render :"/experiments/_form", layout: false
      end
    else
      if @proposal.status == 'Closed'
        redirect_to proposal_path(@proposal)
      end
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
    if @proposal.status == 'Closed'
      redirect_to proposal_path(@proposal)
    else
      if @experiment.save
        if request.xhr?
          render :"/experiments/_experiment", layout: false, locals: { experiment: @experiment }
        else
          redirect_to proposal_experiment_path(@experiment.proposal, @experiment), notice: 'Experiment was successfully created.'
        end
      else
        if request.xhr?
          @errors = @experiment.errors.full_messages
          render :'_errors', layout: false, locals: { errors: @errors }
        else
          render :new
        end
      end
    end
  end

  def update
    @experiment = Experiment.find_by_id(params[:id])

    if @experiment.status != "Closed"
      @experiment.update(experiment_params)
      if @experiment.conclusion != nil && @experiment.conclusion != ''
        @experiment.update_attributes(status: "Closed")
      end
    end
    redirect_to proposal_experiment_path(@experiment.proposal, @experiment)
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

  def redirect_cancel
    redirect_to my_page_path if params[:cancel]
  end

end
