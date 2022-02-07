require "sinatra"
require_relative "./lib/counter"

class CounterApp < Sinatra::Base

  before do
    @counter = Counter.instance
  end

  get '/' do
    erb :index
  end

  post '/increment' do
    @counter.increment
    @counter.time
    redirect '/' 
  end

  post '/decrement' do
    @counter.decrement
    @counter.time
    redirect '/'
  end

  post '/reset' do
    @counter.reset
    @counter.time
    redirect '/'
  end

  
end
