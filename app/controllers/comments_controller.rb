class CommentsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_commentable
  
  def index
    @comments = @commentable.comments.order("created_at desc").page(params[:page])
  end
  
  def new
    @comment = @commentable.comments.new
  end
  
  def create
    @comment = @commentable.comments.new(comment_params)
    
    if @comment.save
      # write a create message to the activity log
      @comment.create_activity :create, owner: current_user
      flash[:info] = "Successfully added comment"
      redirect_to @commentable
      # redirect_to [@commentable, :comments]
    else
      flash[:error] = "Could not create comment"  
      render :new
    end
  end
  
  private
  
  def load_commentable
    klass = [Organisation, System].detect { |c| params["#{c.name.underscore}_id"]}
    @commentable = klass.friendly.find(params["#{klass.name.underscore}_id"])
  end
  
  def comment_params
    params.require(:comment).permit!
  end
end