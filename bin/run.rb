require_relative '../config/environment'
require_all 'lib'


new_cli = CommandLineInterface.new
new_cli.welcome
new_cli.get_name
