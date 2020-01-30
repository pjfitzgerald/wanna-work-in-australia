class JobsController < ApplicationController

  def new
    @job = Job.new
    #create a form
  end

  def create
    @
  end


  private

  def job_params
    params.require(:job).permit(:)
end
