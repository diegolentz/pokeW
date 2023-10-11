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
		
		
		//AGREGA LOS POKEMONES PROPIOS DEL PERSONAJE A LA LISTA DEL PERSONAJE
		
		personaje.iniciaBatalla(personaje.propios())
		rival.iniciaBatalla(rival.propios())
		game.addVisual(personaje.sacaPokemon())
		game.addVisual(rival.sacaPokemon())
		//game.addVisual(rival.pokemones())
		
		self.iniciarBatalla()
	}
	method iniciarBatalla(){
		
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