require 'byebug'

def enter_password

  begin
    puts "whats the password?"
    get_input
  rescue MyCustomError => e
    puts e.message
    retry
  # rescue YetAnotherError

  end

  puts "thanks!"
end

def get_input
  input = gets.chomp

  raise MyCustomError.new("Wrong password!") unless input == "hunter2"
end

class MyCustomError < ArgumentError
end
  
enter_password