define ->
  HeaderView = Backbone.View.extend
    el: $('header')

    events:
      'click nav a': 'navClick'

    navClick: (e) ->
      e.preventDefault()
      $navLink = $(e.currentTarget)
      @navigate($navLink)
      navIndex = @$('nav a').index($navLink)
      DevPath.mainView.scrollToArticle(navIndex)

    navigate: ($navLink) ->
      @$('nav a').removeClass('current')
      $navLink.addClass('current')

    navigateByIndex: (navIndex) ->
      $navLink = $(@$('nav a')[navIndex])
      @navigate($navLink)

  HeaderView
