class ActorsController < ApplicationController
  
  def update
    redirect_to("/actors")
  end
  
  def create
    # params hash looks like this:
    # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}
    m = Actor.new
    m.name = params.fetch("the_title")
    m.dob = params.fetch("the_year")
    m.bio = params.fetch("the_duration")
    m.image = params.fetch("the_description")
    m.save
    redirect_to("/actors")
    # Retrieve the user's inputs from params
    # Create a record in the movie table
    # Populate each column with the user input
    # Save
    # Redirect the user back to the /movies URL
  end

  def destroy
    the_id = params.fetch("an_id")
    matching_records = Actor.where({ :id => the_id })
    the_movie = matching_records.at(0)
    the_movie.destroy
    redirect_to("/actors")
  end
  
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
