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
	
	
	
		var esJugador = true
		var termino = false
		var sinVida = false
	method pelea(){
		
		
		//AGREGA LOS POKEMONES PROPIOS DEL PERSONAJE A LA LISTA DEL PERSONAJE
		
		personaje.iniciaBatalla(personaje.propios())
		rival.iniciaBatalla(rival.propios())
		game.addVisual(personaje.sacaPokemon())
		game.addVisual(rival.sacaPokemon())
		
		
		self.iniciarBatalla()
	}
	method iniciarBatalla(){
		if(esJugador){
			var poke = personaje.pokemones().first()
			keyboard.num1().onPressDo({game.say(rival,"Primer Ataque")})
			keyboard.num1().onPressDo({personaje.sacaPokemon().ataqueMin()})
			rival.sacaPokemon().vida() = (self.vida() - personaje.sacaPokemon().ataqueMin() )
			keyboard.num1().onPressDo({game.say(rival.sacaPokemon())})
			esJugador = false
		}else 
		rival.sacaPokemon().atacar()
		
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