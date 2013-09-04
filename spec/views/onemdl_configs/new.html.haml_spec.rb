require 'spec_helper'

describe "onemdl_configs/new" do
  before(:each) do
    assign(:onemdl_config, stub_model(OnemdlConfig,
      :CompanyName => "MyString",
      :CompanyTagline => "MyString",
      :CompanyPhone => "MyString",
      :CompanyFax => "MyString",
      :CompanyEmail => "MyString",
      :CompanyAddress_1 => "MyString",
      :CompanyAddress_2 => "MyString",
      :CompanyCity => "MyString",
      :CompanyPostCode => "MyString",
      :CompanyCountry => "MyString"
    ).as_new_record)
  end

  it "renders new onemdl_config form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", onemdl_configs_path, "post" do
      assert_select "input#onemdl_config_CompanyName[name=?]", "onemdl_config[CompanyName]"
      assert_select "input#onemdl_config_CompanyTagline[name=?]", "onemdl_config[CompanyTagline]"
      assert_select "input#onemdl_config_CompanyPhone[name=?]", "onemdl_config[CompanyPhone]"
      assert_select "input#onemdl_config_CompanyFax[name=?]", "onemdl_config[CompanyFax]"
      assert_select "input#onemdl_config_CompanyEmail[name=?]", "onemdl_config[CompanyEmail]"
      assert_select "input#onemdl_config_CompanyAddress_1[name=?]", "onemdl_config[CompanyAddress_1]"
      assert_select "input#onemdl_config_CompanyAddress_2[name=?]", "onemdl_config[CompanyAddress_2]"
      assert_select "input#onemdl_config_CompanyCity[name=?]", "onemdl_config[CompanyCity]"
      assert_select "input#onemdl_config_CompanyPostCode[name=?]", "onemdl_config[CompanyPostCode]"
      assert_select "input#onemdl_config_CompanyCountry[name=?]", "onemdl_config[CompanyCountry]"
    end
  end
end
