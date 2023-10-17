import wollok.game.*
import config.*
import personaje.*
import pokemons.*
import config.*

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
	
	
	method pelea(){
	//AGREGA LOS POKEMONES PROPIOS DEL PERSONAJE A LA LISTA DEL PERSONAJE
		personaje.iniciaBatalla(personaje.propios())
		rival.iniciaBatalla(rival.propios())
		
		game.addVisual(personaje.pokemon())
		game.addVisual(rival.pokemon())

		self.configurarTeclas()
		self.turno()
	}
	
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
		if(personaje.pokemon().vida()>0){	
			//EN ESTE MOMENTO PUEDO SELECCIONAR EL ATAQUE
			game.say(personaje.pokemon(), "Vida Restante:" + personaje.pokemon().vida().toString())
			game.say(personaje.pokemon(), "Turno personaje")
			esJugador = false //CAMBIO LA BANDERA
		}else{
			self.pokemonMuerto(personaje)
			if(personaje.propios().all({pokemon=>pokemon.vida()<= 0})){
				self.salir()		
			}else{			
				game.addVisual(personaje.pokemon())
			}	
		}
	}
			
	method turnoRival() {
		  if(rival.pokemon().vida()>0){
			esJugador = true
		  	game.say(rival, "Turno Enemigo")
			game.say(rival.pokemon(),"Vida Restante:" + rival.pokemon().vida().toString())
			game.say(rival, "Ataque")
			personaje.pokemon().atacado(rival.pokemon().atacar())
		}else{
			self.pokemonMuerto(rival)
			if(rival.propios().all({pokemon=>pokemon.vida()<= 0})){
				self.salir()		
			}else{			
				game.addVisual(rival.pokemon())
			}
		} 	
	}
	
	//METODO QUE ELIMINA UN POKEMON CUANDO SE MUERE , RECIBE POR PARAMETRO 
	//EL JUGADOR QUE CORRESPONDE , SI personaje O rival
	method pokemonMuerto(pj){
		game.removeVisual(pj.pokemon())
		pj.pokemones().remove(pj.pokemon())
	}
	//METODO QUE VUELVE A LA PANTALLA INICIAL
	method salir(){
		game.clear()
		config.iniciar()
	}
	 
		
}

class Centro inherits Edificio{
	var property image = "mercado.png"

	
	override method adentro(){
		market.iniciar()
		
	}
	
}

class IconPiso inherits Edificio{
	var property image = ".jpg"

	
	override method adentro(){
		piso.iniciar()
	}
	
}  