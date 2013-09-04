require 'spec_helper'

describe "onemdl_configs/show" do
  before(:each) do
    @onemdl_config = assign(:onemdl_config, stub_model(OnemdlConfig,
      :CompanyName => "Company Name",
      :CompanyTagline => "Company Tagline",
      :CompanyPhone => "Company Phone",
      :CompanyFax => "Company Fax",
      :CompanyEmail => "Company Email",
      :CompanyAddress_1 => "Company Address 1",
      :CompanyAddress_2 => "Company Address 2",
      :CompanyCity => "Company City",
      :CompanyPostCode => "Company Post Code",
      :CompanyCountry => "Company Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Name/)
    rendered.should match(/Company Tagline/)
    rendered.should match(/Company Phone/)
    rendered.should match(/Company Fax/)
    rendered.should match(/Company Email/)
    rendered.should match(/Company Address 1/)
    rendered.should match(/Company Address 2/)
    rendered.should match(/Company City/)
    rendered.should match(/Company Post Code/)
    rendered.should match(/Company Country/)
  end
end
