# PHASE 2
def convert_to_int(str)
  begin
  hash = Hash.new
  hash = {"one"=>"1", "two"=>"2", "five"=>"5"}
  
  Integer(str)
  rescue 
    hash[str]
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue StandardError => e 
    if maybe_fruit == "coffee"
      puts "Try again"
      retry
    # else
    #   raise StandardError
    end
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "name is nil" if name.length <= 0
    
    @name = name
    raise "yrs_known is less than five" if yrs_known < 5
    @yrs_known = yrs_known
    raise "fav_pastime if nil" if fav_pastime <= 0
    @fav_pastime = fav_pastime
  
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


