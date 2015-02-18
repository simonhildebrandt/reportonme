class DatapointsController < ApplicationController
  before_filter :get_tracker
  respond_to :json

  def create
    respond_with @tracker.datapoints.create!(datapoint_params), location: ''
  end

  private

  def datapoint_params
    params.require(:datapoint).permit!
  end

  def get_tracker
    @tracker = current_user.trackers.find(params[:tracker_id])
  end
end
