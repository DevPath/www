define ->
  MainView = Backbone.View.extend
    el: $('#main')

    events:
      'scroll': 'scrolling'

    initialize: ->
      @currentArticleIndex = 0
      @tops = []
      @bottoms = []
      _.each @$('article'), (article) =>
        @tops.push $(article).position().top
        @bottoms.push $(article).position().top + $(article).outerHeight()
      $(window).scroll =>
        @scrolling()

    scrolling: ->
      $window = $(window)
      scrollTop = $window.scrollTop() + $('header').outerHeight()
      if @scrolledDown(scrollTop)
        @currentArticleIndex == ++@currentArticleIndex
        DevPath.header.navigateByIndex(@currentArticleIndex)
      if @scrolledUp(scrollTop)
        @currentArticleIndex == --@currentArticleIndex
        DevPath.header.navigateByIndex(@currentArticleIndex)

    scrolledDown: (currentTop) ->
      currentTop > @tops[@currentArticleIndex + 1]

    scrolledUp: (currentTop) ->
      currentTop < @bottoms[@currentArticleIndex - 1]

  MainView
