class HomeController < ApplicationController
  def index
    redirect_to trackers_path if user_signed_in?
  end
end
