class ActorsController < ApplicationController
    
    def index_actors
        @list_of_actors = Actor.order(:created_at => :desc)
        
        render("actor_templates/index_actor.html.erb")
    end
    
    def new_actor_form
        render("actor_templates/new_actor_form.html.erb")
    
    end
    
    def create_actor_row
        f = Actor.new
        
        f.name = params[:the_name]
        f.bio = params[:the_bio]
        f.dob = params[:the_dob]
        f.image_url = params[:the_image_url]
        
        f.save
        
        redirect_to("/actors")
    end
    
    def show_actors
        @actor = Actor.find(params[:an_id])
        
        render("actor_templates/show_actors.html.erb")
    
    end
    
    def edit_actor_form
        @actor = Actor.find(params[:some_id])
        
        render("actor_templates/edit_actor.html.erb")
        
    end 
    
    def update_actor_row
        
        f = Actor.find(params[:the_id])
        
        f.name = params[:the_name]
        f.dob = params[:the_dob]
        f.bio = params[:the_bio]
        f.image_url = params[:the_image_url]
        
        f.save
        
        redirect_to("/actors/#{f.id}")
    end
    
    def destroy_actor_row
        
        f = Actor.find(params[:toast_id])
        
        f.destroy
        
        redirect_to("/actors")
    end
    
end