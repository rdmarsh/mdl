require 'spec_helper'

describe "Organisations" do
  
  subject { page }
  
  describe "Organisations pages" do
    before { visit organisations_path }
    
    it { should have_content('Organisations') }
    it { should have_title(full_title('')) }
    it { should have_title(full_title('Organisations')) }

    it "should have following links from this array" do
        [
          #nav stuff
          ['Home', href: root_path],
          ['Help', href: help_path],
          ['About', href: about_path],
          ['Contact', href: contact_path],
            
          #item links - restful
          ['Show', href: edit_organisation_path],
          ['Edit', href: edit_organisation_path],
          
        ].each { |a| page.should have_link(a[0], a[1]) }
    end
    
    describe "edit" do
#      let(:user) { FactoryGirl.create(:user) }
#      before { visit edit_user_path(user) }

      describe "page" do
        it { should have_content("Edit ") }
      }
      end

      describe "with invalid information" do
        before { click_button "Save changes" }

        it { should have_content('error') }
      end
    end
  end
end
