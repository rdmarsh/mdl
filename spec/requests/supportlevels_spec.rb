require 'spec_helper'

describe "Supportlevels" do
  subject { page }
  
  describe "Supportlevels pages" do
    before { visit supportlevels_path }
    
    it { should have_content('Support levels') }
    it { should have_title(full_title('')) }
    it { should have_title(full_title('Support levels')) }
    
    it { should have_link(edit_supportlevel_path) }

    it "should have following links from this array" do
        [
          #nav stuff
          ['Home', href: root_path],
          ['Help', href: help_path],
          ['About', href: about_path],
          ['Contact', href: contact_path],
        ].each { |a| page.should have_link(a[0], a[1]) }
      end
      
      describe "edit" do
        let(:supportlevels) { FactoryGirl.create(:supportlevels) }
        before { visit edit_supportlevels_path(supportlevel) }

        describe "page" do
          it { should have_content("Edit Support level") }
          it { should have_title("Edit Support level") }
        end

        describe "with invalid information" do
          before { click_button "Save changes" }

          it { should have_content('error') }

    end
end
