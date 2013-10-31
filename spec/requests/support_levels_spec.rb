require 'spec_helper'

describe "SupportLevels" do
  
  subject { page }
  
  describe "SupportLevels pages" do
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
          ['FAQ', href: faq_path],
        ].each { |a| page.should have_link(a[0], a[1]) }
    end
  end
end
