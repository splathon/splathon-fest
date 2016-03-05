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
        scene.find('.alpha .vote-button').text data.theme.alpha
        scene.find('.bravo .vote-button').text data.theme.bravo
        @current_theme = data.theme.id
        @update_vote_count alpha: 0, bravo: 0

        scene.removeClass('hidden')
      when 'vote'
        @update_vote_count alpha: data.alpha, bravo: data.bravo

  connected: ->
    ['alpha', 'bravo'].forEach (side) =>
      $(".#{side} .vote-button").on 'click', (e) =>
        @perform('vote', theme: @current_theme, side: side)

  current_theme: 0

  update_vote_count: (sides) ->
    scene = $('.scene.voting')
    ['alpha', 'bravo'].forEach (side) =>
      counter = scene.find(".#{side} .vote-counter .count")
      counter.text(sides[side])
