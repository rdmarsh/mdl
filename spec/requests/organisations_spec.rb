require 'spec_helper'

describe "Organisations" do
  describe "GET /organisations" do
    it "should display some organisations" do
      visit organisations_path
      expect(page).to have_content('ac3')
    end
  end
end
