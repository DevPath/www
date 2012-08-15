window.DevPath ||= {}

require ['header', 'mainView'], (HeaderView, MainView) ->
  DevPath.header = new HeaderView
  DevPath.mainView = new MainView
