require_relative '../config/environment'



new_cli = CommandLineInterface.new
new_cli.welcome
new_cli.get_name
new_cli.display_emoji_choices
new_cli.event_categories
new_cli.describe_event
