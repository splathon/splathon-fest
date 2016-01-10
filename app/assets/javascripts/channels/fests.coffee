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
        @update_voters alpha: [], bravo: []

        scene.removeClass('hidden')
      when 'vote'
        @update_voters alpha: data.alpha, bravo: data.bravo

  connected: ->
    ['alpha', 'bravo'].forEach (side) =>
      $(".#{side} .vote-button").on 'click', (e) =>
        @perform('vote', theme: @current_theme, side: side)

  current_theme: 0

  update_voters: (sides) ->
    scene = $('.scene.voting')
    ['alpha', 'bravo'].forEach (side) =>
      list = scene.find(".#{side} ul.voters")
      list.empty()
      sides[side].forEach (voter) =>
        li = $('<li></li>')
        li.text(voter.name)
        list.append(li)
