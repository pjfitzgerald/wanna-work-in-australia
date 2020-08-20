class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def visa; end
  def super; end
  def driving; end
  def rsa; end
  def work_cover; end
  def health; end
  def rates; end
  def accommodation; end
  def tfn; end
  def banking; end
  def phone; end

end
