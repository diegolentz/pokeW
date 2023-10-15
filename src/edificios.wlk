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
	
	
	const pokeJugador = personaje.sacaPokemon()
	const pokeRival = rival.sacaPokemon()
	
	method pelea(){
	//AGREGA LOS POKEMONES PROPIOS DEL PERSONAJE A LA LISTA DEL PERSONAJE
		personaje.iniciaBatalla(personaje.propios())
		rival.iniciaBatalla(rival.propios())
		
		game.addVisual(personaje.pokemon())
		game.addVisual(rival.pokemon())

		self.configurarTeclas()
		self.turno()
	}
<<<<<<< HEAD
	
	//DEFINO LA ASIGNACION DE TECLAS
	method configurarTeclas(){
		keyboard.num1().onPressDo({
			game.say(personaje.pokemon(), "Primer Ataque")
			//"atacado" ES UN METODO DEL POKEMON,RECIBE POR PARAMETRO 
			// EL ATAQUE SELECCIONADO, EL CUAL RETORNA UN DAÑO
			rival.pokemon().atacado(personaje.pokemon().ataqueMin())
		})
		keyboard.num2().onPressDo({
			game.say(personaje.pokemon(), "Segundo Ataque")
			rival.pokemon().atacado(personaje.pokemon().ataqueMed())
		})
		keyboard.num3().onPressDo({
			game.say(personaje.pokemon(), "Tercer Ataque")
			rival.pokemon().atacado(personaje.pokemon().ataqueAlt())
		})
	}
	
	//SISTEMA DE TURNOS 
	method turno(){
		//EVALUO LA BANDERA JUGADOR, COMO SIEMPRE QUIERO QUE COMIENCE
		//EL JUGADOR, ARRANCO "esJugador" EN true
		if(esJugador){
			self.turnoJugador()//LLAMA AL TURNO DEL JUGADOR
		}else{
			self.turnoRival()//LLAMA AL TURNO DEL RIVAL
		}
	}
		
	method turnoJugador(){
		//VALIDO SI EL POKEMON ESTA VIVO , SI LA VIDA ES MENOR A 0 REMUEVE AL POKEMON 
		if(personaje.pokemon().vida() > 0){	
			//EN ESTE MOMENTO PUEDO SELECCIONAR EL ATAQUE
			game.say(personaje.pokemon(), "Vida Restante:" + personaje.pokemon().vida().toString())
			game.say(personaje.pokemon(), "Turno personaje")
			esJugador = false //CAMBIO LA BANDERA
		}else{
			game.removeVisual(personaje.pokemon())
			personaje.pokemones().remove(personaje.pokemon())
			if(personaje.pokemones().isEmpty()){
				game.clear()
				config.iniciar()	
			}
			game.addVisual(personaje.pokemon())
			
		}	
=======
	method turnoJugador(){

	
		if(pokeJugador.vida() > 0){			
			//asdasd
			keyboard.num1().onPressDo({game.say(pokeJugador,"Primer Ataque")})
			keyboard.num1().onPressDo({pokeJugador.ataqueMin()})
			keyboard.num1().onPressDo({game.say(pokeRival,pokeRival.vida().toString())})

			keyboard.num2().onPressDo({game.say(pokeJugador,"Segundo Ataque")})
			keyboard.num2().onPressDo({pokeJugador.ataqueMed()})
			keyboard.num2().onPressDo({game.say(pokeRival,pokeRival.vida().toString())})
			
			keyboard.num3().onPressDo({game.say(pokeJugador,"Tercer Ataque")})
			keyboard.num3().onPressDo({pokeJugador.ataqueAlt()})
			keyboard.num3().onPressDo({game.say(pokeRival,pokeRival.vida().toString())})
			var vida = pokeRival.vida()
			pokeRival.vida(vida - pokeJugador.ataqueMin()) 
			
			//esJugador = false
			keyboard.num5().onPressDo({self.turnoRival()})
			
		}	
	}
	method turnoRival() {
		
		if(pokeRival.vida()>0){
		pokeRival.atacar()
		//esto guarda la vida del pokemon para calcular el descuento
		var vida = personaje.sacaPokemon().vida()
		pokeJugador.vida(vida - rival.sacaPokemon().atacar())
		game.say(pokeJugador,pokeJugador.vida().toString())
>>>>>>> ea49cae052b2dc8c23686e91682af1fc7e504a8d
		
	}
		
	method turnoRival() {
		  if(rival.pokemon().vida()>0){
			esJugador = true
		  	game.say(rival, "Turno Enemigo")
			game.say(rival.pokemon(),"Vida Restante:" + rival.pokemon().vida().toString())
			game.say(rival, "Ataque")
			personaje.pokemon().atacado(rival.pokemon().atacar())
		}else{
			game.removeVisual(rival.pokemon())
			rival.pokemones().remove(rival.pokemon())
			if(rival.pokemones().isEmpty()){
				game.clear()
				config.iniciar()	
			}
			game.addVisual(rival.pokemon())
		} 	
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