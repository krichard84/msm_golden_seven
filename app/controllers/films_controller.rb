class FilmsController < ApplicationController
    
    def index_movies
        @list_of_films = Movie.order(:created_at => :desc)

        render("film_templates/index_movies.html.erb")
    end
    
    def new_movie_form
        render("film_templates/new_movie_form.html.erb")
    
    end
    
    def create_movie_row
        f = Movie.new
        
        f.title = params[:the_title]
        f.year = params[:the_year]
        f.duration = params[:the_duration]
        f.description = params[:the_description]
        f.image_url = params[:the_image_url]
        
        f.save
        
        redirect_to("/movies")
    end
    
    def show_movies
        @movie = Movie.find(params[:an_id])
        
        render("film_templates/show_movie.html.erb")
    
    end
    
    def edit_movie_form
        @movie = Movie.find(params[:some_id])
        
        render("film_templates/edit_movie.html.erb")
        
    end 
    
    def update_movie_row
        
        f = Movie.find(params[:the_id])
        
        f.title = params[:the_title]
        f.year = params[:the_year]
        f.duration = params[:the_duration]
        f.description = params[:the_description]
        f.image_url = params[:the_image_url]
        
        f.save
        
        redirect_to("/movies/#{f.id}")
    end
    
    def destroy_movie_row
        
        f = Movie.find(params[:toast_id])
        
        f.destroy
        
        redirect_to("/movies")
    end
end
