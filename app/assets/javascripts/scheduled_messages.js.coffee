# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#scheduled_message_scheduled_at_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#scheduled_message_scheduled_at_time').timepicker
  	showOn: 'focus'
  	showPeriod: true,
    showLeadingZero: true
