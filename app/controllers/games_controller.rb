class GamesController < ApplicationController
    include Simulate
    
    def index
        @session = Game.new
        @session.save
    
        #pull id from newly created created object and use it to link form to new game
        @id = @session.id
    end
    
    def show
        @players = Player.where(:game_id => fetch)
        
        @living = simulate(@players)
        
        if simulate(@players).length == 1
            game = Game.where(:id => fetch)
            game.each do |g|
                g.destroy 
            end
            @done = true
        end
    end
    
    def simulator
        @alert = false
        
        unless params[:player] == nil
            @game_id = fetch
        
            @all = Player.where(:game_id => @game_id)
            @name = params[:player][:name]
            
            if check(@name, @all)
                #new player's score is determined using parameters on games#simulator
                @player = Player.new
                @player.game_id = @game_id
                @player.name = params[:player][:name]
                
                if params[:player][:age].to_i >=30
                    @player.score -= 5
                else
                    @player.score +=2
                end
                
                case params[:skill]
                
                when "1"
                    @player.score += 5
                when "2"
                    @player.score += 5
                when "3"
                    @player.score += 10
                when "4"
                    @player.score -= 5
                end
                
                case params[:kindness]
                
                when "1"
                    @player.score -= 1
                when "3"
                    @player.score += 3
                when "4"
                    @player.score += 5
                when "5"
                    @player.score -= 1
                end
                
                @player.score = params[:improvise].to_i + 4
                @player.score = params[:combat].to_i - 1
                @player.score = params[:sociability].to_i - 1
                @player.score = params[:emotions].to_i + 4
                @player.score = params[:intelligence].to_i + 3
                @player.score = params[:strength].to_i + 3
                
                @player.save
                
                
            else
                @alert = true
            end
            
            #initialize new variable with added players
            @every_player = Player.where(:game_id => @game_id)
        end
    end
    
    private
    
        def fetch
            url = request.path_parameters
            return url[:id]
        end
        
        def check(name, players)
        #iterates through all players checking for duplicates
        #return values used to determine if duplicate exists
        #if return true -> duplicate exists
        #else -> duplicate does not exist
            players.each do |p|
                if name.downcase == p.name.downcase
                    return false
                else
                    return true
                end
            end
        end
end
