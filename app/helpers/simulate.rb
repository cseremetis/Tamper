module Simulate
    
    #function used to determine which players are alive and dead
    #players is an array
    #breaks players down into groups of 2 and pits them against each other
    def simulate(players)
        living = []
        
        @factor = 0
        
        #used to break down odd numbers
        if players.length % 2 == 1
            survivor = players[players.length - 1]
            living << survivor
        end
        
        for i in 0...(players.length/2)
            #there is almost definitely a better way to do this
            #but right now I am very tired
            #please forgive my laziness
            a = players[@factor]; @factor += 1
            b = players[@factor]; @factor += 1

            if a.score >= b.score
                b.destroy
                living << a
            else
                a.destroy
                living << b
            end
            
            i += 1
        end 
        
        return living
    end
end