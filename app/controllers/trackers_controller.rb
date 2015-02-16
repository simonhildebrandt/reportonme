class TrackersController < ApplicationController
  before_action :authenticate_user!
  before_filter :get_tracker, only: [:update, :destroy]

  def index
    @trackers = current_user.trackers
  end

  def new
    @tracker = current_user.trackers.new
  end

  def create
    current_user.trackers.create! tracker_params
  end

  def update
    @tracker.update_attributes(tracker_params)
  end

  def destroy
    @tracker.destroy!
  end

  private

  def tracker_params
    params.expect(:tracker).permit(:name)
  end

  def get_tracker
    @tracker = current_user.trackers.find(params[:id])
  end

end
