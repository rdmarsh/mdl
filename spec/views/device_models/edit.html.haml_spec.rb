require 'spec_helper'

describe "device_models/edit" do
  before(:each) do
    @device_model = assign(:device_model, stub_model(DeviceModel))
  end

  it "renders the edit device_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", device_model_path(@device_model), "post" do
    end
  end
end
