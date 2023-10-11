import wollok.game.*
import config.*
import personaje.*
import pokemons.*

class Edificio {
	var property position = 0	
	
	method teEncontro(){
		game.clear()
		self.adentro()		

	}		
	method adentro(){
		gimnasio.iniciar()
	}
}

class Gimnasio inherits Edificio{
	var property image = "gimnasio.png"
	
	
	
	method pelea(){
		var esJugador = true
		var termino = false
		var sinVida = false
		//const posJugador = game.at(7,7)
		
		//const pok = personaje.sacaPokemon()
		//pok.position(10,10)
		game.addVisual(charmileon)
		//jugador.
	}
	
	
}

class Centro inherits Edificio{
	var property image = "mercado.png"

	
	override method adentro(){
		market.iniciar()
		
	}
	
}

class PeleaPiso inherits Edificio{
	var property image = ".png"

	
	override method adentro(){
		//pelea.iniciar()
	}
	
}