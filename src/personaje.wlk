import wollok.game.*
import config.*
import pokemons.*



class Human{
	
	
}

object personaje inherits Human{
    var property position = game.at(2,12)
    var property image = "player_Up.png"
    var property posicionAnterior = game.at(2, 12)   
   
   
    const pokemones = [charmileon]
   
    method irA(nuevaPosicion) {
			posicionAnterior = position
            position = nuevaPosicion         
    }
	
	method pos() {
		game.say(self,position)
	}
	method iniciaBatalla(){
		
	}
	method iniciaMarket(){}
	
	
	method sacaPokemon() = charmileon
}


object rival inherits Human{
    var property position = game.at(20,12)
    var property image = "enemigoBatalla.png"
    
    const pokemones = [machamp,blastoise,mewTwo]
    
    method batalla(){
    	
    }
   
}


object enfermera{
   var property position = game.at(12,8)
    var property image = "enfermera.png"
    
   
}
