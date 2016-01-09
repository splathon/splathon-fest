App.cable.subscriptions.create { channel: 'FestChannel', fest_id: gon.fest.id },
  received: (data) ->
    li = $('<li></li>')
    li.text(data.name)
    $('.player-list').append(li)
