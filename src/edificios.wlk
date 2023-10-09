import wollok.game.*
import config.*
import personaje.*


class Edificio {
	
	method teEncontro(){
		//personaje.position(personaje.posicionAnterior())
		game.say(personaje,"el gym")
	}		
}

class Gimnasio inherits Edificio{
	var property image = "gimnasio.png"
	var property position = 0	
}

class Centro inherits Edificio{
	var property image = "mercado.png"
	var property position = 0
}
