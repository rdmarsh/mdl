require 'spec_helper'

describe "onemdl_configs/index" do
  before(:each) do
    assign(:onemdl_configs, [
      stub_model(OnemdlConfig,
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
      ),
      stub_model(OnemdlConfig,
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
      )
    ])
  end

  it "renders a list of onemdl_configs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Tagline".to_s, :count => 2
    assert_select "tr>td", :text => "Company Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Company Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Company Email".to_s, :count => 2
    assert_select "tr>td", :text => "Company Address 1".to_s, :count => 2
    assert_select "tr>td", :text => "Company Address 2".to_s, :count => 2
    assert_select "tr>td", :text => "Company City".to_s, :count => 2
    assert_select "tr>td", :text => "Company Post Code".to_s, :count => 2
    assert_select "tr>td", :text => "Company Country".to_s, :count => 2
  end
end
