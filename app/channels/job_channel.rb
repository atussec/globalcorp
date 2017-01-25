class JobChannel < ApplicationCable::Channel
  def subscribed
    board_id = params[:board]
    stream_from "job_board_#{board_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def add
  end

  def remove
  end
end
