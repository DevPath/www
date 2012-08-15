window.DevPath ||= {}

require ['header', 'mainView'], (HeaderView, MainView) ->
  window.DevPath.header = new HeaderView
  window.DevPath.mainView = new MainView
