App.cable.subscriptions.create { channel: 'FestChannel', fest_id: 1 },
  received: (data) ->
    li = $('<li></li>')
    li.text(data.name)
    $('.player-list').append(li)
