import wollok.game.*
import config.*


object personaje {
    var property position = game.at(2,4)
    var property image = "player_Up.png"
    var property posicionAnterior = game.at(6, 19)   
   
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
}


object rival{
    var property position = game.at(20,12)
    var property image = "enemigoBatalla.png"
    
   
}


object enfermera{
   var property position = game.at(12,8)
    var property image = "enfermera.png"
    
   
}
