require 'spec_helper'

describe "configurations/edit" do
  before(:each) do
    @configuration = assign(:configuration, stub_model(Configuration,
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
    ))
  end

  it "renders the edit configuration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", configuration_path(@configuration), "post" do
      assert_select "input#configuration_CompanyName[name=?]", "configuration[CompanyName]"
      assert_select "input#configuration_CompanyTagline[name=?]", "configuration[CompanyTagline]"
      assert_select "input#configuration_CompanyPhone[name=?]", "configuration[CompanyPhone]"
      assert_select "input#configuration_CompanyFax[name=?]", "configuration[CompanyFax]"
      assert_select "input#configuration_CompanyEmail[name=?]", "configuration[CompanyEmail]"
      assert_select "input#configuration_CompanyAddress_1[name=?]", "configuration[CompanyAddress_1]"
      assert_select "input#configuration_CompanyAddress_2[name=?]", "configuration[CompanyAddress_2]"
      assert_select "input#configuration_CompanyCity[name=?]", "configuration[CompanyCity]"
      assert_select "input#configuration_CompanyPostCode[name=?]", "configuration[CompanyPostCode]"
      assert_select "input#configuration_CompanyCountry[name=?]", "configuration[CompanyCountry]"
    end
  end
end
