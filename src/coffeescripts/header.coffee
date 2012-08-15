define ->
  HeaderView = Backbone.View.extend
    el: $('header')

    events:
      'click nav a': 'navClick'

    navClick: (e) ->
      e.preventDefault()
      @navigate($(e.currentTarget))

    navigate: ($navLink) ->
      @$('nav a').removeClass('current')
      $navLink.addClass('current')

  HeaderView
