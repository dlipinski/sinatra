require 'sinatra'
require 'sinatra/reloader'

set :number => rand(4)

@@remaining_guesses = 5

get '/' do

    guess = params['guess'].to_i
    locals = check_guess(guess)

    @@remaining_guesses = @@remaining_guesses -1
    if @@remaining_guesses <= 0
        number = rand(4)
        locals['remaining_guesses'] =  "Didn't guessed 5 times, generating new number."
        @@remaining_guesses = 5
    else
        locals['remaining_guesses'] =  @@remaining_guesses.to_s + " chances left."
    end

    erb :index, :locals => locals 

end

def check_guess(guess)
    if guess > settings.number
        if guess - settings.number > 5
            return {:message => "Way too high!", :background => "red"}
        else
            return {:message => "Too high!", :background => "lightcoral"}
        end
    elsif guess < settings.number
        if settings.number - guess > 5
            return {:message => "Way too low!", :background => "red"}
        else
            return {:message => "Too low!", :background => "lightcoral"}
        end
    else
        return {:message => "Correct! The number is " + settings.number.to_s + "!", :background => "green"}
    end
end