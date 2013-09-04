json.array!(@configurations) do |configuration|
  json.extract! configuration, :CompanyName, :CompanyTagline, :CompanyPhone, :CompanyFax, :CompanyEmail, :CompanyAddress_1, :CompanyAddress_2, :CompanyCity, :CompanyPostCode, :CompanyCountry
  json.url configuration_url(configuration, format: :json)
end
