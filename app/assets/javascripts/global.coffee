# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


window.start_job_countdown = (time, finish_path) ->
  curtime = moment().add(time, 'seconds')
  if time > 0
    window.setTimeout(
      (-> window.start_job_countdown(time - 1, finish_path)),
      1000
    )
    $('#finish-time').text("in " + moment.preciseDiff(curtime, moment()))
  else
    finish = $('#finish-link')
    finish.attr('class', 'btn')
    finish.attr('href', finish_path)
    finish.text('Finish')
    $('#finish-time').text('')