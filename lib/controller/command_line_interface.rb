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
    
    if mood == 'Good' then feeling = prompt.select("What is your feeling?") do |menu|
      menu.choice 'Excited'
      menu.choice 'Grateful'
      menu.choice 'Inspired'
      menu.choice 'Loved'
      menu.choice 'Calm'
    end
    elsif mood == 'Not so great' then feeling = prompt.select("What is your feeling?") do |menu|
      menu.choice 'Depressed'
      menu.choice 'Lonely'
      menu.choice 'Disappointed'
      menu.choice 'Jealous'
      menu.choice 'Hungry'
      menu.choice 'Anxious'
      end
    end
    feeling_intensity = prompt.select("How strong is this feeling on a scale of 1-5 (5 being the strongest)?") do |menu|
      menu.choice '1'
      menu.choice '2'
      menu.choice '3'
      menu.choice '4'
      menu.choice '5'
    end
    Feeling.create(name: feeling,user_id: User.all.last.id, intensity: feeling_intensity)
  end

#   def intensity
#     prompt = TTY::Prompt.new
#     feeling_intensity = prompt.select("How strong is this feeling on a scale of 1-5 (5 being the strongest)?") do |menu|
#     menu.choice '1'
#     menu.choice '2'
#     menu.choice '3'
#     menu.choice '4'
#     menu.choice '5'
#   end
  
# end

def event_categories
  prompt = TTY::Prompt.new
  event_category = prompt.select("What part of your life is this related to?") do |menu|
  menu.choice 'Love'
  menu.choice 'Career'
  menu.choice 'Family'
  menu.choice 'Social'
  menu.choice 'Food'
end
event_description = prompt.ask("What happened?")
event_description
Event.create(category: event_category,description: event_description)
# Feeling.update_column(:event_id, Event.all.last.id)
end

# def describe_event
#   prompt = TTY::Prompt.new
# event_description = prompt.ask("What happened?")
# event_description
# end


end

# 'Not so great' then prompt.select("What is your feeling?") do |menu|
