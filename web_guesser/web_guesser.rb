require 'sinatra'
require 'sinatra/reloader'

get '/' do
    "The secret number is " + rand(100).to_s
end