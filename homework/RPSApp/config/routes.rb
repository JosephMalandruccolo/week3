RPS::Application.routes.draw do

  get '/rps', :controller => 'rps', :action => 'index', :as => :rps

  get '/rps/result', :controller => 'rps', :action => 'show' 

end