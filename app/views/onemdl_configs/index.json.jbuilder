json.array!(@onemdl_configs) do |onemdl_config|
  json.extract! onemdl_config, :CompanyName, :CompanyTagline, :CompanyPhone, :CompanyFax, :CompanyEmail, :CompanyAddress_1, :CompanyAddress_2, :CompanyCity, :CompanyPostCode, :CompanyCountry
  json.url onemdl_config_url(onemdl_config, format: :json)
end
