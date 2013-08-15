require 'spec_helper'

describe "Organisations" do
  describe "GET /organisations" do
    it "display some organisations" do
      visit organisations_path
      page.should have_content 'updated task'
    end
  end
end
