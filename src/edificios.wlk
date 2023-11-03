import wollok.game.*
import config.*
import personaje.*
import pokemons.*
import config.*
import city.*
import objectos.*

class Gimnasio {
	var property position = 0	
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
	
	method iniciarPersonajes(pj){
		pj.iniciaBatalla(pj.propios().filter({pokemon=>not pokemon.muerto()}))
		game.addVisual(pj.pokemon())
	}
	
	method pelea(){
	//AGREGA LOS POKEMONES PROPIOS DEL PERSONAJE A LA LISTA DEL PERSONAJE
		self.iniciarPersonajes(personaje)
		self.iniciarPersonajes(enemigo)
		
		self.configurarTeclas()
		
	}
	//DEFINO LA ASIGNACION DE TECLAS

	method configurarTeclas(){
		keyboard.num1().onPressDo({game.say(personaje.pokemon(), "Primer Ataque") enemigo.pokemon().atacado(personaje.pokemon().elegirAtaque(0)) self.win(enemigo) personaje.pokemon().atacado(enemigo.pokemon().atacar()) self.defeat(personaje)})
		keyboard.num2().onPressDo({game.say(personaje.pokemon(), "Segundo Ataque") enemigo.pokemon().atacado(personaje.pokemon().elegirAtaque(1)) self.win(enemigo) personaje.pokemon().atacado(enemigo.pokemon().atacar()) self.defeat(personaje)})
		keyboard.num3().onPressDo({game.say(personaje.pokemon(), "Tercer Ataque") enemigo.pokemon().atacado(personaje.pokemon().elegirAtaque(2)) self.win(enemigo) personaje.pokemon().atacado(enemigo.pokemon().atacar()) self.defeat(personaje)})
		keyboard.num4().onPressDo({poti.usar(personaje.pokemon()) game.say(personaje.pokemon(),personaje.pokemon().vida().toString()) game.say(enemigo.pokemon(),"Atacando") personaje.pokemon().atacado(enemigo.pokemon().atacar()) game.say(personaje.pokemon(),personaje.pokemon().vida().toString())})
		keyboard.num5().onPressDo({ superPoti.usar(personaje.pokemon()) game.say(personaje.pokemon(),personaje.pokemon().vida().toString()) game.say(enemigo.pokemon(),"Atacando") personaje.pokemon().atacado(enemigo.pokemon().atacar()) game.say(personaje.pokemon(),personaje.pokemon().vida().toString())})
	}
	
	method turnoJugador(pj){
		if(pj.pokemon().muerto()){
			self.estaMuerto(pj)//VALIDO SI EL POKEMON ESTA VIVO 
		} 
		game.say(pj.pokemon(), "Vida:" + pj.pokemon().vida().toString())
	}
	
	method ataqueEnemigo(){
		personaje.pokemon().atacado(enemigo.pokemon().atacar())
		game.say(personaje.pokemon(),personaje.pokemon().vida().toString())
	} 
	
	method win(pj){
		if(self.estanTodosMuertos(pj)){
			personaje.propios().forEach({pokemon=>pokemon.sube(pokemon)})
			personaje.recompensa(100)	
			self.salir()	
		}
		self.turnoJugador(pj)
	}
	
	method defeat(pj){
		if(self.estanTodosMuertos(pj)){
			enemigo.propios().forEach{pokemon => pokemon.vida(200)}
			self.salir()			
		}
		self.turnoJugador(pj)
	}
	
	method estaMuerto(pj){
		self.pokemonMuerto(pj)
		self.agregarPokemon(pj)
	}
	
	method estanTodosMuertos(pj) = pj.propios().all({pokemon=>pokemon.muerto()})
	
	method agregarPokemon(pj){game.addVisual(pj.pokemon())}
	
	method murieron(){
		if(self.noPuedenEntrar()) {
			self.salir()
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
		self.eliminarTodos()
		game.clear()
		config.iniciar()
	}
	
	method eliminarTodos(){
		enemigo.pokemones().clear()
		personaje.pokemones().clear()
	}
	
	method noPuedenEntrar() = self.estanTodosMuertos(personaje) or self.estanTodosMuertos(enemigo)
}

class Centro {

	var property position = game.at(0,0)

	method image() = "mercado.png"
	
	method teEncontro(){
		game.clear()
		personaje.position(personaje.posicionAnterior())
		self.adentro()		
	}		
	
	method adentro(){market.iniciar()}
	
	method mostrarPrecios() = ["¡Bienvenido al market!","Pociones: " + poti.precio() + " monedas","SuperPotis: " + superPoti.precio() + " monedas."] 

    method mostrarMensajes() {self.mostrarPrecios().forEach({mensaje=> game.say(enfermera,mensaje)})}
}

class IconPiso inherits Gimnasio{
	
	override method image() = "hierba.png"

	override method adentro(){piso.iniciar()}
	
	override method configurarTeclas(){
		super()
		keyboard.num6().onPressDo({if (not pokebola.puedeAtrapar(enemigo.pokemon())){self.noLoAtrapo()} self.loAtrapo()})
	}
	
	method loAtrapo(){
		pokebola.usar(enemigo.pokemon())
		self.salir()
	}
	
	method noLoAtrapo(){
		self.error("No pudiste atraparlo")
		self.ataqueEnemigo()
	}

	override method salir(){
		super()
		enemigo.propios().clear()
		enemigo.propios().add(enemigo.lista().anyOne())
	}

}