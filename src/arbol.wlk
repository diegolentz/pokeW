import wollok.game.*
import config.*
import personaje.*

class Arbol {
    var property image = "arbol.png"
    var property position = 0

    method teEncontro() {
        personaje.position(personaje.posicionAnterior())
        game.say(personaje, "¡Cuidado, el arbol...")
    }
}

class ArbolInvisible inherits Arbol {
   
    override method teEncontro() {
         personaje.position(personaje.posicionAnterior())
    }
}

class CartelMarket inherits Arbol{
	
	override method teEncontro(){
		personaje.position(personaje.posicionAnterior())
		game.say(self,"ingresa para comprar artigulos")
	}
	
}
class CartelGym inherits Arbol{
	
	override method teEncontro(){
		personaje.position(personaje.posicionAnterior())
		game.say(self,"ingresa para combatir")
	}
	
}