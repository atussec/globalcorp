class JobChannel < ApplicationCable::Channel
  def subscribed
    board_id = params[:board]
    stream_from "job_board_#{board_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.add(job, channel)
    ActionCable.server.broadcast("job_board_#{channel}", board: channel, job: ApplicationController.render(job))
  end

  def self.remove(job, channel)
    ActionCable.server.broadcast("job_board_#{channel}", board: channel, jobId: job.id)
  end
end
