require 'sinatra/base'
require_relative 'lib/player'
$players = Array.new

class Battle < Sinatra::Base
#   set :session_secret, "fix shotgun session error"
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

  get '/' do
    erb :index
  end

  post '/names' do
    $players.push(Player.new(params[:player_1_name]))
    $players.push(Player.new(params[:player_2_name]))
    redirect to('/play')
  end 
  
  get '/play' do 
    @player_1_name = $players[0].name
    @player_2_name = $players[1].name
    erb :play
  end 

  get '/attack' do
    @player_1_name = $players[0].name
    @player_2_name = $players[1].name
    erb :attack
  end
 
  # start the server if ruby file executed directly
  run! if app_file == $0
end


