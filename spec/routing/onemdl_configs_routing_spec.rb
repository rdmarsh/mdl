require "spec_helper"

describe OnemdlConfigsController do
  describe "routing" do

    it "routes to #index" do
      get("/onemdl_configs").should route_to("onemdl_configs#index")
    end

    it "routes to #new" do
      get("/onemdl_configs/new").should route_to("onemdl_configs#new")
    end

    it "routes to #show" do
      get("/onemdl_configs/1").should route_to("onemdl_configs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/onemdl_configs/1/edit").should route_to("onemdl_configs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/onemdl_configs").should route_to("onemdl_configs#create")
    end

    it "routes to #update" do
      put("/onemdl_configs/1").should route_to("onemdl_configs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/onemdl_configs/1").should route_to("onemdl_configs#destroy", :id => "1")
    end

  end
end
