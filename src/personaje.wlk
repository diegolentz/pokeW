import wollok.game.*
import config.*
import pokemons.*



class Human{
	const property pokemones = []
	
	
	//AGREGA LOS POKEMONES PROPIOS 
	//DE CADA PERSONAJE A SU JUGADOR CORRESPONDIENTE	
	method iniciaBatalla(propios){
	    pokemones.addAll(propios)
	}
	//RETORNA EL PRIMER POKEMON 
	//DE LA LISTA DE CADA PERSONAJE
	method sacaPokemon() = pokemones.first()
}

object personaje inherits Human{
    var property position = game.at(2,12)
    var property image = "player_Up.png"
    var property posicionAnterior = game.at(2, 12)   
   	
   	//LISTA DE POKEMONES PROPIOS DEL PERSONAJE
   	const property propios = []
   	propios.
   	
    
    
   
    method irA(nuevaPosicion) {
			posicionAnterior = position
            position = nuevaPosicion         
    }
	
	method pos() {
		game.say(self,position)
	}
	method iniciaMarket(){}
	
	
	
}


object rival inherits Human{
    var property position = game.at(20,12)
    var property image = "enemigoBatalla.png"
    
    //LISTA DE POKEMONES PROPIOS DEL PERSONAJE
    var property propios = [machamp,blastoise,mewTwo]
    
    
   
}


object enfermera{
   var property position = game.at(12,8)
    var property image = "enfermera.png"
    
   
}