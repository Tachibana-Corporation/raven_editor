# Designed by Tyrel Tachibana for use by the Tachibana Software Company
# Desgined on 08/12/2019

# Varaibles
$company = "Tachibana Software Company"
$company_link = "https://www.tachibanasoftware.com/"
$program_information = "Trying to remember how to build a connection string was a pain, " +
                      "so I built this program.\n\nDesigned by Tachibana Software Company(™)\n#{$company_link}"
$license = "This code is free to use and edit by non-commercial users.\n" +
          "Any upgrades or edits provided outside of the organization are still wholley owned by #{$company} and subject to this license.\n"
$software_version = "0.0.1 (Alpha)"
$application_name = "Raven_Editor"
$root_directory = __dir__.split($application_name)[0] + $application_name
$project_type = ""
$project_name = ""
$active_file = ""
$project_path = ""
$detected_operating_system = ""

# Required ruby code
require "#{$root_directory}/app/view/application_builder.rb"

# Start Main application
$program = Application_Builder.new
$program.start
