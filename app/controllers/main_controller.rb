class MainController < ApplicationController
  def index
    @courses = Course.all
    @locations = Location.all
  end
end
