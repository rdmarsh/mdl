class SupportlevelsController < ApplicationController
  def index
    @supportlevels = Supportlevel.all
  end
end
