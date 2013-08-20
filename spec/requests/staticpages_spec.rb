require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    
    it { should have_content('Home') }
    it { should have_title(full_title('')) }
    it { should have_title('| Home') }

    it "should have following links from this array" do
        [
          #nav stuff
          ['Home', href: root_path],
          ['Help', href: help_path],
          ['About', href: about_path],
          ['Contact', href: contact_path]
        ].each { |a| page.should have_link(a[0], a[1]) }
    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('')) }
    it { should have_title(full_title('Help')) }
    
    it "should have following links from this array" do
        [
          #nav stuff
          ['Home', href: root_path],
          ['Help', href: help_path],
          ['About', href: about_path],
          ['Contact', href: contact_path]
        ].each { |a| page.should have_link(a[0], a[1]) }
    end
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('')) }
    it { should have_title(full_title('About')) }

    it "should have following links from this array" do
        [
          #nav stuff
          ['Home', href: root_path],
          ['Help', href: help_path],
          ['About', href: about_path],
          ['Contact', href: contact_path]
        ].each { |a| page.should have_link(a[0], a[1]) }
    end
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('')) }
    it { should have_title(full_title('Contact')) }

    it "should have following links from this array" do
        [
          #nav stuff
          ['Home', href: root_path],
          ['Help', href: help_path],
          ['About', href: about_path],
          ['Contact', href: contact_path]
        ].each { |a| page.should have_link(a[0], a[1]) }
    end
  end
end
