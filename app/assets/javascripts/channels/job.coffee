App.create_board_channel = (boardId) ->
  if App.job
    cache = App.job
    App.cable.subscriptions.reload cache
  else
    App.job = App.cable.subscriptions.create {channel: "JobChannel", board: boardId},
      board: ->
        boardId

      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        if data.job && data.board == boardId
          $('.jobs-list-grid-container').append(data.job)
        else if data.jobId && data.board == boardId
          $("#job-#{data.jobId}").remove()

