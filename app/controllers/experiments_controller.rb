class ExperimentsController < ApplicationController

  def new
    @experiment = Experiment.new
  end

end
