class JobsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @venue = Venue.find(params[:venue_id])
    @job = Job.find(params[:id])
    @application = Application.find_by(job: @job, traveller: current_user)
    # raise
  end

  def new
    @job = Job.new
    #create a form
  end

  def create
    @job = Job.new(job_params)   #double check syntax for retrieving params

    #  check for empty fields
    if params[:job][:title].empty?
      flash[:notice] = "Woops! Please enter a title!"
    elsif params[:job][:description].empty?
      flash[:notice] = "Woops! Please enter a description!"
    else
      if @job.save
        flash[:notice] = "Job submitted"
      else
        flash[:notice] = "Something went wrong!"
      end
    end
    redirect_back(fallback_location: dashboard_path)
  end


  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
