class TrackersController < ApplicationController
  before_action :authenticate_user!
  before_filter :get_tracker, only: [:update, :destroy]

  respond_to :html, :json


  def index
    @trackers = current_user.trackers
    respond_with @trackers
  end

  def new
    @tracker = current_user.trackers.new
  end

  def create
    @tracker = current_user.trackers.create tracker_params
    respond_with @tracker
  end

  def update
    @tracker.update_attributes(tracker_params)
    respond_with @tracker
  end

  def destroy
    @tracker.destroy
    respond_with @tracker
  end

  private

  def tracker_params
    params.require(:tracker).permit(:name)
  end

  def get_tracker
    @tracker = current_user.trackers.find(params[:id])
  end

end
