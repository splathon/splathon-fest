App.cable.subscriptions.create { channel: 'FestChannel', fest_id: gon.fest.id },
  received: (data) ->
    switch data.event
      when 'player_signup'
        li = $('<li></li>')
        li.text(data.fest.name)
        $('.player-list').append(li)
      when 'open_theme'
        $('.scene').addClass('hidden')

        scene = $('.scene.voting')
        scene.find('p.alpha').text data.theme.alpha
        scene.find('p.bravo').text data.theme.bravo

        scene.removeClass('hidden')
