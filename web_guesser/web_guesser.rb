require 'sinatra'
require 'sinatra/reloader'


set :number => rand(4)

get '/' do    
    guess = params['guess'].to_i
    message = check_guess(guess)
    erb :index, :locals => {:message => message}
end

def check_guess(guess)
    if guess > settings.number
        if guess - settings.number > 5
            return "Way too high!"
        else
            return "Too high!"
        end
    elsif guess < settings.number
        if settings.number - guess > 5
            return "Way too low!"
        else
            return"Too low!"
        end
    else
        return "Correct! The number is " + settings.number.to_s 
    end
end