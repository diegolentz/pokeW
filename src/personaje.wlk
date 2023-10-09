import wollok.game.*
import config.*


object personaje {
    var property position = game.at(2,4)
    var property image = "player_Up.png"
    var property posicionAnterior = game.at(6, 19)   
   
    method irA(nuevaPosicion) {
			posicionAnterior = position

    }
	
	method pos() {
		game.say(self,position)
	}
}