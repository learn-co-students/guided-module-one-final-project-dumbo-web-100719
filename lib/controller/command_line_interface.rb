require 'tty-prompt'
require 'pry'

class CommandLineInterface
  def welcome
    puts "Welcome to MoodHacker!"
    puts "Take charge of your life by looking inward."
  end

  def get_name
    prompt = TTY::Prompt.new
    @name = prompt.ask("What is your name?")
    @user = User.create(name: @name)
  end

  def feeling_attributes
    prompt = TTY::Prompt.new
    @mood = prompt.select("How are you feeling today, #{@user.name}?") do |menu|
    # binding.pry
    menu.choice 'Good'
    menu.choice 'Not so great'
    end
    
    if @mood == 'Good' then @feeling = prompt.select("What is your feeling?") do |menu|
      menu.choice 'Excited'
      menu.choice 'Grateful'
      menu.choice 'Inspired'
      menu.choice 'Loved'
      menu.choice 'Calm'
    end
    elsif @mood == 'Not so great' then @feeling = prompt.select("What is your feeling?") do |menu|
      menu.choice 'Depressed'
      menu.choice 'Lonely'
      menu.choice 'Disappointed'
      menu.choice 'Jealous'
      menu.choice 'Hungry'
      menu.choice 'Anxious'
      end
    end
    @feeling_intensity = prompt.select("How strong is this feeling on a scale of 1-5 (5 being the strongest)?") do |menu|
      menu.choice '1'
      menu.choice '2'
      menu.choice '3'
      menu.choice '4'
      menu.choice '5'
    end
    @feeling_instance = Feeling.create(name: @feeling,user_id: @user.id , intensity: @feeling_intensity)
  end

def event_categories
  prompt = TTY::Prompt.new
  @event_category = prompt.select("What part of your life is this related to?") do |menu|
  menu.choice 'Love'
  menu.choice 'Career'
  menu.choice 'Family'
  menu.choice 'Social'
  menu.choice 'Food'
end
event_description = prompt.ask("What happened?")
event_description
@event = Event.create(category: @event_category,description: @event_description)
end

def create_feeling
  Feeling.create(name: @feeling, intensity: @feeling_intensity, user_id: @user.id, event_id: @event.id)
end

# def describe_event
#   prompt = TTY::Prompt.new
# event_description = prompt.ask("What happened?")
# event_description
# end


end

# 'Not so great' then prompt.select("What is your feeling?") do |menu|
