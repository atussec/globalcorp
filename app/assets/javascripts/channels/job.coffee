$( document ).ready ->
  boardId = $('#job_board_id').html();
  App.job = App.cable.subscriptions.create {channel: "JobChannel", board: boardId},
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel

    add: ->
      @perform 'add'

    remove: ->
      @perform 'remove'
