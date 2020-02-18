class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @resources = Resource.first(8)
  end

  def about
  end
  
end
