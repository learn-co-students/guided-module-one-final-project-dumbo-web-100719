require_relative '../config/environment'



new_cli = CommandLineInterface.new
new_cli.welcome
new_cli.get_name
new_cli.feeling_attributes
new_cli.event_categories
new_cli.create_feeling
# new_cli.display_logger
new_cli.display_events
