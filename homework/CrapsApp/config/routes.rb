CrapsApp::Application.routes.draw do
  
  get "/dice", :controller => "dice", :action => 'index'

  post "dice", :controller => "dice", :action => 'index'

  post "/dice/roll", :controller => "dice", :action => 'show'

  post "/dice/play", :controller => "dice", :action => 'play'


end
