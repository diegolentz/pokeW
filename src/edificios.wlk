import wollok.game.*
import config.*
import personaje.*
import pokemons.*
import config.*
import city.*
import objectos.*

class Gimnasio {
	var property position = 0	
	var  esJugador = true
	//var property enemigo

	method image() = "gimnasio.png"
	
	
	
	method teEncontro(){
		game.clear()
		personaje.position(personaje.posicionAnterior())
		self.adentro()		

	}		
	method adentro(){
		gimnasio.iniciar()
	}
	
	
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
			rival.pokemon().atacado(personaje.pokemon().ataqueMin(),gimnasio)
		})
		keyboard.num2().onPressDo({
			game.say(personaje.pokemon(), "Segundo Ataque")
			rival.pokemon().atacado(personaje.pokemon().ataqueMed(),gimnasio)	
		})
		keyboard.num3().onPressDo({
			game.say(personaje.pokemon(), "Tercer Ataque")
			rival.pokemon().atacado(personaje.pokemon().ataqueAlt(),gimnasio)
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
			game.say(personaje.pokemon(), "Vida:" + personaje.pokemon().vida().toString())
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
			game.say(rival.pokemon(),"Vida:" + rival.pokemon().vida().toString())
		  	game.say(rival, "Turno Enemigo")
			game.say(rival, "Ataque")
			personaje.pokemon().atacado(rival.pokemon().atacar(),gimnasio)
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
		
		pj.pokemones().remove(pj.pokemon()) //ada podria hacer un sort con vida para que quede a lo ultimo el mas lastimado
	}
	//METODO QUE VUELVE A LA PANTALLA INICIAL
	method salir(){
		rival.pokemones().forEach({pokemon=>pokemon.vida(200)})
		game.clear()
		config.iniciar()
	}
	 
		
}

class Centro {
	var property image = "mercado.png"
	var property position = game.at(0,0)

	method teEncontro(){
		game.clear()
		self.adentro()		

	}		
	
	method adentro(){
		market.iniciar()
		
	}
	method mostrarPrecios() {
        var mensaje = "¡Bienvenido al Mercado Pokémon!\n" +
                      "Precio de pociones: " + poti.precio() + " monedas.\n" +
                      "Precio de superPoti: " + superPoti.precio() + " monedas."
        
        game.say(enfermera,mensaje)
	}	
}

class IconPiso inherits Gimnasio{
	//var esJugador = true
	
	override method image() = ".jpg"

	override method adentro(){
		piso.iniciar()
	}
	
	override method pelea(){
	//AGREGA LOS POKEMONES PROPIOS DEL PERSONAJE A LA LISTA DEL PERSONAJE
		personaje.iniciaBatalla(personaje.propios())
		pisoCombat.iniciaBatalla(pisoCombat.propios())
		
		game.addVisual(personaje.pokemon())
		game.addVisual(pisoCombat.pokemon())

		self.configurarTeclas()
		self.turno()
	}
	
	override method configurarTeclas(){
		keyboard.num1().onPressDo({
			game.say(personaje.pokemon(), "Primer Ataque")	
			pisoCombat.pokemon().atacado(pisoCombat.pokemon().ataqueMin(),piso)
		})
		keyboard.num2().onPressDo({
			game.say(personaje.pokemon(), "Segundo Ataque")
			pisoCombat.pokemon().atacado(pisoCombat.pokemon().ataqueMed(),piso)
		})
		keyboard.num3().onPressDo({
			game.say(personaje.pokemon(), "Tercer Ataque")
			pisoCombat.pokemon().atacado(pisoCombat.pokemon().ataqueAlt(),piso)
		})
		keyboard.num4().onPressDo({
			poti.usar(personaje.pokemon())
		})
		keyboard.num5().onPressDo({
			superPoti.usar(personaje.pokemon())
		})
		keyboard.num6().onPressDo({
			pokebola.usar(pisoCombat.pokemon())	
		})
	}

			
	override method turnoRival() {
		  if(pisoCombat.pokemon().vida()>0){
			esJugador = true
			game.say(pisoCombat.pokemon(),"Vida:" + pisoCombat.pokemon().vida().toString())
			game.say(pisoCombat.pokemon(), "Ataque")
			personaje.pokemon().atacado(pisoCombat.pokemon().atacar(),piso)
		}else{
			//self.pokemonMuerto(pokePiso)
			if(pisoCombat.pokemon().vida()<= 0){
				game.removeVisual(pisoCombat.pokemon())
				self.salir()		
			}
		} 	
	}
	

	
	 
}  

