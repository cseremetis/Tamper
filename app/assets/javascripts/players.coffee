#used to create new players and add to player array

class Player
    constructor: (@name) ->
        @living = true
        #@id_pic = green_dot
        #location = (x, y)
        
    die: ->
        @living = false
        #@id_pic = red_diamond
        #location = (x, y)
        
    
    