App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if (data['currency'])
      $('#dollar').html(data['currency'])


  currency: (currency, expired) ->
    @perform 'currency', currency: currency, expired: expired

$ ->
  $('form').on 'submit', (event)->
      App.room.currency $('#currency').val() , $('#expires').val()
      event.preventDefault()