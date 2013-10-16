class PeopleController < ApplicationController
  respond_to :html, :xml, :json, :csv
  helper_method :sort_column, :sort_direction
  
  def index
    @people = Person.order(sort_column + " " + sort_direction).page(params[:page])
    respond_with(@people)
  end
  
  def show
    @person = Person.friendly.find(params[:id])
    respond_with(@person)
  end
  
  def new
    @person = Person.new
    respond_with(@person)
  end
  
  def create
    @person = Person.new(person_params)
    
    if @person.save
      # write a create message to the activity log
      @person.create_activity :create, owner: current_user
      flash[:info] = "Successfully created person '" + @person.name + "'"
    else
      flash[:error] = "Could not create person '" + @person.name + "'"
    end
    
    respond_with(@person)
  end
  
  def edit
    @person = Person.friendly.find(params[:id])
    respond_with(@person)
  end
  
  def update
    @person = Person.friendly.find(params[:id])
    
    if @person.update_attributes(person_params)
      # write an update message to the activity log
      @person.create_activity :update, owner: current_user
      flash[:info] = "Successfully updated person '" + @person.name + "'"
    else
      flash[:error] = "Could not update person '" + @person.name + "'"
    end
    
    respond_with(@person)
  end
  
  def destroy
    @person = Person.friendly.find(params[:id])
    
    # write an update message to the activity log, it fails with a "cannot call create unless the parent is saved" inside the if statement, so I've put it here. It works out anyway, as we can show both successes and failures
    @person.create_activity :destroy, owner: current_user
    if @person.destroy
      flash[:info] = "Successfully deleted person '" + @person.name + "'"
    else
      flash[:error] = "Could not delete person '" + @person.name + "'"
    end
    
    respond_with(@person)
  end
  
  def graph
  end
  
  private
  
  # for sorting columns
  def sort_column
    Person.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # for allowing editing on fields
  def person_params
    params.require(:person).permit!
  end
end