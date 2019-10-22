require 'tty-prompt'
class CommandLineInterface
  def welcome
    puts "Welcome to MoodHacker!"
    puts "Take charge of your life by looking inward."
  end

  def get_name
    
    name = prompt.ask("What is your name?")
    User.create(name: name)
  end

  def display_emoji_choices(name)
    prompt = TTY::Prompt.new
    mood = prompt.select("How are you feeling today,#{name}")
    mood
  end
end
