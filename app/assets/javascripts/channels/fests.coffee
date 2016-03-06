App.cable.subscriptions.create { channel: 'FestChannel', fest_id: gon.fest.id },
  received: (data) ->
    switch data.event
      when 'player_signup'
        li = $('<li></li>')
        li.text(data.fest.name)
        $('.player-list').append(li)

      when 'open_theme'
        $('.scene').addClass('hidden')
        @update_theme(data.theme)
        $('.scene.voting').removeClass('hidden')

      when 'fix_theme'
        $('.scene').addClass('hidden')
        $('.scene.fixed').removeClass('hidden')

      when 'vote'
        @update_vote_count alpha: data.alpha, bravo: data.bravo

  connected: ->
    ['alpha', 'bravo'].forEach (side) =>
      $(".#{side} .vote-button").on 'click', (e) =>
        @perform('vote', theme: @current_theme, side: side)

  current_theme: 0

  update_theme: (theme) ->
    scene = $('.scene.voting, .scene.fixed')
    scene.find('.alpha .vote-button').text theme.alpha
    scene.find('.bravo .vote-button').text theme.bravo
    @current_theme = theme.id
    @update_vote_count alpha: 0, bravo: 0

  update_vote_count: (sides) ->
    scene = $('.scene.voting, .scene.fixed')
    ['alpha', 'bravo'].forEach (side) =>
      counter = scene.find(".#{side} .vote-counter .count")
      counter.text(sides[side])
