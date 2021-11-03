# Designed by Nathanial Tachibana for use by the Tachibana Corporation
# Designed on 08/12/2019

# Varaibles
$company = "Tachibana Corporation(™)"
$company_link = "https://www.tachibana.tech/"
$program_information = "Trying to remember how to build a connection string was a pain, " +
                      "so I built this program.\n\nDesigned by #{$company}\n#{$company_link}"
$license = "This code is free to use, and is licensed by the Tachibana Corporation Software License.\n" + "Code was designed by #{$company}.\n"
$software_version = "0.1.0 (Alpha)"
$application_name = "Raven Editor"
$application_path = "raven_editor_ruby_ide"
$root_directory = __dir__.split($application_path)[0] + $application_path
$project_type = ""
$project_name = ""
$active_file = ""
$project_path = ""

# Required ruby code
require "#{$root_directory}/app/view/application_builder.rb"

# Start Main application
$program = Application_Builder.new
$program.start
