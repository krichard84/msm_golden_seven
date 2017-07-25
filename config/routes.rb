Rails.application.routes.draw do

  get("/", { :controller => "films", :action => "index_all" })
  
  #CREATE
  
  get("/movies/new", { :controller => "films", :action => "new_movie_form"})
  get("/create_movie", { :controller => "films", :action => "create_movie_row"})
  
  get("/directors/new", { :controller => "directors", :action => "new_director_form" })
  get("/create_director", { :controller => "directors", :action => "create_director_row"})
  
  get("/actors/new", { :controller => "actors", :action => "new_actor_form"})
  get("/create_actor", {:controller => "actors", :action => "create_actor_row"})
  
  #READ
  
  get("/movies", { :controller => "films", :action => "index_movies"})
  get("/movies/:an_id", { :controller => "films", :action => "show_movies"})
  
  get("/directors", { :controller => "directors", :action => "index_directors"})
  get("/directors/:an_id", { :controller => "directors", :action => "show_directors"})
  
  get("/actors", { :controller => "actors", :action => "index_actors"})
  get("/actors/:an_id", { :controller => "actors", :action => "show_actors"})
  
  #UPDATE
  
  get("/movies/:some_id/edit", { :controller => "films", :action => "edit_movie_form"})
  get("/update_movie/:the_id", { :controller => "films", :action => "update_movie_row"})
  
  get("/directors/:some_id/edit", { :controller => "directors", :action => "edit_director_form"})
  get("/update_director/:the_id", { :controller => "directors", :action => "update_director_row"})
  
  get("/actors/:some_id/edit", { :controller => "actors", :action => "edit_actor_form"})
  get("/update_actor/:the_id", { :controller => "actors", :action => "update_actor_row"})
  
  #DELETE
  
  get("/delete_movie/:toast_id", { :controller => "films", :action => "destroy_movie_row"})
  get("/delete_director/:toast_id", { :controller => "directors", :action => "destroy_director_row"})
  get("/delete_actor/:toast_id", { :controller => "actors", :action => "destroy_actor_row"})
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
