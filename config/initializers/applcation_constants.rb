VALID_OPERATING_SYSTEM_FAMILIES = %w{ Unknown None Unix Linux BSD Windows MacOSX Other }
SELECT_OPERATING_SYSTEM_FAMILIES = VALID_OPERATING_SYSTEM_FAMILIES.map { |s| [s.capitalize, s] }