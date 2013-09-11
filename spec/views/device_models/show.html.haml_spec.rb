require 'spec_helper'

describe "device_models/show" do
  before(:each) do
    @device_model = assign(:device_model, stub_model(DeviceModel))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
