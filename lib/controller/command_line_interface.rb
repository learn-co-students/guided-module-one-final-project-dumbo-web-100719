require 'tty-prompt'
require 'pry'
class CommandLineInterface
  def welcome
    puts "Welcome to MoodHacker!"
    puts "Take charge of your life by looking inward."
  end

  def get_name
    prompt = TTY::Prompt.new
    name = prompt.ask("What is your name?")
    User.create(name: name)
  end

  def display_emoji_choices
    prompt = TTY::Prompt.new
    mood = prompt.select("How are you feeling today, #{User.last.name}?") do |menu|
   menu.choice 'Good'
   menu.choice 'Not so great'
    mood
    end
  end

end

