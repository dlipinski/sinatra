require 'bundler'
Bundler.require

class IdeaBoxApp < Sinatra::Base
    get '/' do
        'Hello, world!'
    end
end