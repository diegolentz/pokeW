import wollok.game.*
import config.*
import personaje.*
import pokemons.*
import config.*
import city.*
import objectos.*

class Gimnasio {
	var property position = 0	
	//var  esJugador = true
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
	}
	//DEFINO LA ASIGNACION DE TECLAS

	method configurarTeclas(){
		keyboard.num1().onPressDo({
			game.say(personaje.pokemon(), "Primer Ataque")
			//"atacado" ES UN METODO DEL POKEMON,RECIBE POR PARAMETRO 
			// EL ATAQUE SELECCIONADO, EL CUAL RETORNA UN DAÑO
			enemigo.pokemon().atacado(personaje.pokemon().elegirAtaque(0))
			self.turnoJugador(enemigo)
			personaje.pokemon().atacado(enemigo.pokemon().atacar())
			self.turnoJugador(personaje)
		})
		keyboard.num2().onPressDo({
			game.say(personaje.pokemon(), "Segundo Ataque")
			enemigo.pokemon().atacado(personaje.pokemon().elegirAtaque(1))	
			self.turnoJugador(enemigo)
			personaje.pokemon().atacado(enemigo.pokemon().atacar())
			self.turnoJugador(personaje)
		})
		keyboard.num3().onPressDo({
			game.say(personaje.pokemon(), "Tercer Ataque")
			enemigo.pokemon().atacado(personaje.pokemon().elegirAtaque(2))
			self.turnoJugador(enemigo)
			personaje.pokemon().atacado(enemigo.pokemon().atacar())
			self.turnoJugador(personaje)
		})
		keyboard.num4().onPressDo({
			poti.usar(personaje.pokemon())
			game.say(personaje.pokemon(),personaje.pokemon().vida().toString())
			game.say(enemigo.pokemon(),"Atacando")
			personaje.pokemon().atacado(enemigo.pokemon().atacar())
			game.say(personaje.pokemon(),personaje.pokemon().vida().toString())
		})
		keyboard.num5().onPressDo({
			superPoti.usar()
			game.say(personaje.pokemon(),personaje.pokemon().vida().toString())
			game.say(enemigo.pokemon(),"Atacando")
			personaje.pokemon().atacado(enemigo.pokemon().atacar())
			game.say(personaje.pokemon(),personaje.pokemon().vida().toString())
				
		})
	}
	
	method estanTodosMuertos(pj) = pj.pokemones().all({pokemon=>pokemon.muerto()})
		
	method turnoJugador(pj){
		//VALIDO SI EL POKEMON ESTA VIVO , SI LA VIDA ES MENOR A 0 REMUEVE AL POKEMON 
		if(pj.pokemon().muerto()){	
			self.pokemonMuerto(pj)
			if(self.estanTodosMuertos(pj)){
				self.salir()		
			}else{			
				game.addVisual(pj.pokemon())
			}	
		}
		game.say(pj.pokemon(), "Vida:" + pj.pokemon().vida().toString())
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
		personaje.pokemones().clear()
		game.clear()
		config.iniciar()
	}
}

class Centro {

	var property position = game.at(0,0)

	method image() = "mercado.png"
	
	method teEncontro(){
		game.clear()
		personaje.position(personaje.posicionAnterior())
		self.adentro()		
	}		
	
	method adentro(){
		market.iniciar()
	}
	
	method mostrarPrecios() {
        const mensaje =["¡Bienvenido al market!","Pociones: " + poti.precio() + " monedas","SuperPotis: " + superPoti.precio() + " monedas."] 
        mensaje.forEach({algo => game.say(enfermera,algo)})
    }
}

class IconPiso inherits Gimnasio{
	
	override method image() = "hierba.png"

	override method adentro(){
		piso.iniciar()
	}
	
	override method configurarTeclas(){
		super()
		keyboard.num6().onPressDo({
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
		enemigo.propios().add(enemigo.lista().anyOne())
	}

}