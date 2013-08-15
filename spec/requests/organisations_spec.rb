require 'spec_helper'

describe "Organisations" do
  describe "GET /organisations" do
    it "display some organisations" do
      visit organisations_path
      page.should have_content 'ac3'
    end
  end
end
