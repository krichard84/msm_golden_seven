class DirectorsController < ApplicationController
    
    def index_directors
        @list_of_directors = Director.order(:created_at => :desc)
        
        render("director_templates/index_director.html.erb")
    end
    
    def new_director_form
        render("director_templates/new_director_form.html.erb")
    
    end
    
    def create_director_row
        f = Director.new
        
        f.name = params[:the_name]
        f.bio = params[:the_bio]
        f.dob = params[:the_dob]
        f.image_url = params[:the_image_url]
        
        f.save
        
        redirect_to("/directors")
    end
    
    def show_directors
        @director = Director.find(params[:an_id])
        
        render("director_templates/show_directors.html.erb")
    
    end
    
    def edit_director_form
        @director = Director.find(params[:some_id])
        
        render("director_templates/edit_director.html.erb")
        
    end 
    
    def update_director_row
        
        f = Director.find(params[:the_id])
        
        f.name = params[:the_name]
        f.dob = params[:the_dob]
        f.bio = params[:the_bio]
        f.image_url = params[:the_image_url]
        
        f.save
        
        redirect_to("/directors/#{f.id}")
    end
    
    def destroy_director_row
        
        f = Director.find(params[:toast_id])
        
        f.destroy
        
        redirect_to("/directors")
    end
    
end