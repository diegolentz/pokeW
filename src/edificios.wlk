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
		
		self.turnoJugador()
	}
	method turnoJugador(){
		const pokeJugador = personaje.sacaPokemon()
		const pokeRival = rival.sacaPokemon()
	
		if(pokeJugador.vida() > 0){			
			//asdasd
			keyboard.num1().onPressDo({game.say(pokeJugador,"Primer Ataque")})
			keyboard.num1().onPressDo({pokeJugador.ataqueMin()})
			keyboard.num2().onPressDo({game.say(pokeJugador,"Segundo Ataque")})
			keyboard.num2().onPressDo({pokeJugador.ataqueMed()})
			keyboard.num3().onPressDo({game.say(pokeJugador,"Tercer Ataque")})
			keyboard.num3().onPressDo({pokeJugador.ataqueAlt()})
			var vida = pokeRival.vida()
			pokeRival.vida(vida - pokeJugador.ataqueMin()) 
			
			keyboard.num1().onPressDo({game.say(pokeRival,pokeRival.vida().toString())})
			//esJugador = false
			keyboard.num5().onPressDo({self.turnoRival()})
			
		}	
	}
	method turnoRival() {
		const pokeJugador = personaje.sacaPokemon()
		const pokeRival = rival.sacaPokemon()
	
		if(pokeRival.vida()>0){
		pokeRival.atacar()
		//esto guarda la vida del pokemon para calcular el descuento
		var vida = personaje.sacaPokemon().vida()
		pokeJugador.vida(vida - rival.sacaPokemon().atacar())
		game.say(pokeJugador,pokeJugador.vida().toString())
		
		keyboard.num5().onPressDo({self.turnoJugador()})}
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