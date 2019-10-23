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
    end
    # mood
    
    if mood == 'Good' then prompt.select("What is your feeling?") do |menu|
      menu.choice 'Excited'
      menu.choice 'Grateful'
      menu.choice 'Inspired'
      menu.choice 'Loved'
      menu.choice 'Calm'
    end
    elsif mood == 'Not so great' then prompt.select("What is your feeling?") do |menu|
      menu.choice 'Depressed'
      menu.choice 'Lonely'
      menu.choice 'Disappointed'
      menu.choice 'Jealous'
      menu.choice 'Hungry'
      menu.choice 'Anxious'
      end
    end
  end


end

# 'Not so great' then prompt.select("What is your feeling?") do |menu|
