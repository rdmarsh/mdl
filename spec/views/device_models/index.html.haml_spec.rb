require 'spec_helper'

describe "device_models/index" do
  before(:each) do
    assign(:device_models, [
      stub_model(DeviceModel),
      stub_model(DeviceModel)
    ])
  end

  it "renders a list of device_models" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
