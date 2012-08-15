define ->
  MainView = Backbone.View.extend
    el: $('#main')

    events:
      'scroll': 'scrolling'

    initialize: ->
      @currentArticleIndex = 0
      offset = $('header').outerHeight()
      @tops = []
      @bottoms = []
      _.each @$('article'), (article) =>
        @tops.push $(article).position().top - offset
        @bottoms.push $(article).position().top + $(article).outerHeight() - offset
      $(window).scroll =>
        @scrolling()

    scrolling: ->
      unless @blockScrolling
        @blockScrolling = true
        $window = $(window)
        scrollTop = $window.scrollTop()
        if @scrolledDown(scrollTop)
          @currentArticleIndex == ++@currentArticleIndex
          DevPath.header.navigateByIndex(@currentArticleIndex)
        if @scrolledUp(scrollTop)
          @currentArticleIndex == --@currentArticleIndex
          DevPath.header.navigateByIndex(@currentArticleIndex)
        @blockScrolling = false

    scrolledDown: (currentTop) ->
      currentTop > @tops[@currentArticleIndex + 1]

    scrolledUp: (currentTop) ->
      currentTop < @bottoms[@currentArticleIndex - 1]

    scrollToArticle: (articleIndex) ->
      scrollY = @tops[articleIndex] + 10
      @blockScrolling = true
      $('body').animate {scrollTop: scrollY}, =>
        @blockScrolling = false

  MainView
