ActionController::Routing::Routes.draw do |map|

  map.resources :searches, :only => [:show, :index, :new, :create]
  map.resources :words, :only => :show
  map.resources :kanjis, :only => :show
  map.about 'about', :controller => 'statics', :action => 'about'
  map.contact 'contact', :controller => 'statics', :action => 'contact'


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.root :new_search 
end
