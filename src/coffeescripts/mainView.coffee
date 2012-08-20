define ->
  MainView = Backbone.View.extend
    el: $('#main')

    events:
      'scroll': 'scrolling'

    initialize: ->
      @setArticlePositions()
      @findCurrentArticleIndex()
      $(window).scroll =>
        @scrolling()
      DevPath.header.navigateByIndex(@currentArticleIndex)

    findCurrentArticleIndex: ->
      scrollTop = $(window).scrollTop()
      for articleTop, i in @tops
        if articleTop > scrollTop
          @currentArticleIndex = i - 1
          return
      @currentArticleIndex = @tops.length - 1

    setArticlePositions: ->
      @tops = []
      @bottoms = []
      _.each @$('article'), (article) =>
        articleTop = $(article).position().top
        articleHeight = $(article).outerHeight()
        @tops.push(@offset(articleTop))
        @bottoms.push(@offset(articleTop + articleHeight))

    scrolling: ->
      unless @blockScrolling
        @blockScrolling = true
        if @scrolledDown()
          @currentArticleIndex = ++@currentArticleIndex
          DevPath.header.navigateByIndex(@currentArticleIndex)
        if @scrolledUp()
          @currentArticleIndex = --@currentArticleIndex
          DevPath.header.navigateByIndex(@currentArticleIndex)
        @blockScrolling = false

    scrolledDown: ->
      $(window).scrollTop() > @tops[@currentArticleIndex + 1]

    scrolledUp: ->
      $(window).scrollTop() < @bottoms[@currentArticleIndex - 1]

    scrollToArticle: (articleIndex) ->
      scrollY = @tops[articleIndex]
      @blockScrolling = true
      $('body').animate {scrollTop: scrollY}, =>
        @blockScrolling = false

    offset: (position) ->
      parseInt(position - $('header').outerHeight())

  MainView
