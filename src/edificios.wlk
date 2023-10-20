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
	var  enemigo

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
		enemigo.iniciaBatalla(enemigo.propios())
		
		game.addVisual(personaje.pokemon())
		game.addVisual(enemigo.pokemon())

		self.configurarTeclas()
		self.turno()
	}
	//DEFINO LA ASIGNACION DE TECLAS

	method configurarTeclas(){
		keyboard.num1().onPressDo({
			game.say(personaje.pokemon(), "Primer Ataque")
			//"atacado" ES UN METODO DEL POKEMON,RECIBE POR PARAMETRO 
			// EL ATAQUE SELECCIONADO, EL CUAL RETORNA UN DAÑO
			enemigo.pokemon().atacado(personaje.pokemon().ataqueMin(),self)
		})
		keyboard.num2().onPressDo({
			game.say(personaje.pokemon(), "Segundo Ataque")
			enemigo.pokemon().atacado(personaje.pokemon().ataqueMed(),self)	
		})
		keyboard.num3().onPressDo({
			game.say(personaje.pokemon(), "Tercer Ataque")
			enemigo.pokemon().atacado(personaje.pokemon().ataqueAlt(),self)
		})
		keyboard.num4().onPressDo({
			poti.usar(personaje.pokemon())
			game.say(personaje.pokemon(),personaje.pokemon().vida().toString())
			self.turno()
		})
		keyboard.num5().onPressDo({
			superPoti.usar()
			game.say(personaje.pokemon(),personaje.pokemon().vida().toString())
			self.turno()	
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
		  if(enemigo.pokemon().vida()>0){
			esJugador = true
			game.say(enemigo.pokemon(),"Vida:" + enemigo.pokemon().vida().toString())
		  	game.say(enemigo.pokemon(), "Turno Enemigo")
		//	game.say(enemigo.pokemon(), "Ataque")
			personaje.pokemon().atacado(enemigo.pokemon().atacar(),self)
		}else{
			personaje.pokemon().sube()
			personaje.pokemon().evoluciona(personaje.pokemon())
			game.say(personaje.pokemon(),"recompensa " + personaje.recompensa(75))
			self.pokemonMuerto(enemigo)
			if(enemigo.propios().all({pokemon=>pokemon.vida()<= 0})){
				self.salir()		
			}else{			
				game.addVisual(enemigo.pokemon())
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
		enemigo.propios().forEach{pokemon => pokemon.vida(200)}
		game.clear()
		config.iniciar()
	}
}

class Centro {
	var property image = "mercado.png"

	var property position = game.at(0,0)

	method teEncontro(){
		game.clear()
		personaje.position(personaje.posicionAnterior())
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
	
	override method image() = ".jpg"

	override method adentro(){
		piso.iniciar()
	}
	
	override method configurarTeclas(){
		super()
		keyboard.num6().onPressDo({
			//pokebola.puedeAtrapar(enemigo.pokemon())
			if(pokebola.puedeAtrapar(enemigo.pokemon())){
				pokebola.usar(enemigo.pokemon())
				self.salir()
			}else{
				game.say(self,"ooooole gato!")
			}
			})
	}

	override method salir(){
		super()
		enemigo.propios().clear()
		enemigo.propios().add(enemigo.aleatorio())
	}

}
