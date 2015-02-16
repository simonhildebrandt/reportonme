class DatapointsController < ApplicationController
  before_filter :get_tracker

  def create
    @tracker.datapoints.create!(datapoint_params)
    redirect_to trackers_path
  end

  private

  def datapoint_params
    params.require(:datapoint).permit!
  end

  def get_tracker
    @tracker = current_user.trackers.find(params[:tracker_id])
  end
end
