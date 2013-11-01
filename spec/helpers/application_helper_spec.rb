require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  describe "test page title test" do
    it "has an empty page title" do
      helper.full_title('').should == "onemdl"
    end
    
    it "hase a page title" do
      helper.full_title('pagetitle') == "onemdl | papgetitle"
    end
  end
end
