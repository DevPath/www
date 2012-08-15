window.DevPath ||= {}

require ['header', 'mainView'], (HeaderView, MainView) ->
  window.DevPath.header = new HeaderView
  mainView = new MainView
