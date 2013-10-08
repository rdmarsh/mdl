class VersionsController < ApplicationController
  def index
    @versions = Version.page(params[:page])
    respond_with(@versions)
  end
end
