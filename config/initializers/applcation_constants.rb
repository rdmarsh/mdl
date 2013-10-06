# onemdl constants
# COMPANY_NAME = "onemdl"
# COMPANY_TAGLINE = ""
# COMPANY_PHONE = ""
# COMPANY_FAX = ""
# COMPANY_EMAIL = ""
# COMPANY_ADDRESS_1 = ""
# COMPANY_ADDRESS_2 = ""
# COMPANY_CITY = ""
# COMPANY_POSTCODE = ""
# COMPANY_COUNTRY = ""

# valid OS families, will be replaced by a table
VALID_OPERATING_SYSTEM_FAMILIES = %w{ Unknown None Unix Linux BSD Windows MacOSX Other }
SELECT_OPERATING_SYSTEM_FAMILIES = VALID_OPERATING_SYSTEM_FAMILIES.map { |s| [s.capitalize, s] }