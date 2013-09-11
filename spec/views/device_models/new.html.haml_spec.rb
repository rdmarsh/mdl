require 'spec_helper'

describe "device_models/new" do
  before(:each) do
    assign(:device_model, stub_model(DeviceModel).as_new_record)
  end

  it "renders new device_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", device_models_path, "post" do
    end
  end
end
