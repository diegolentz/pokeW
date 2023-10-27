import wollok.game.*
import config.*
import personaje.*

class Arbol {
    
    var property position = 0

    method image() = "arbol.png"
    
    method teEncontro() {
        personaje.position(personaje.posicionAnterior())
        //game.say(personaje, "¡Cuidado, el arbol...")
    }
}

class ArbolInvisible inherits Arbol {
   	
    override method teEncontro() {
    	// super()
         //personaje.position(personaje.posicionAnterior())
    }
}

class CartelMarket inherits Arbol{
	
	override method image() = "cartelM.png"
	
	override method position() = game.at(22,10)
	
	override method teEncontro(){
		super()
		game.say(self,"ingresa para comprar artigulos")
	}
	
}
class CartelGym inherits CartelMarket{
	override method position() = game.at(4,14)
	
	override method teEncontro(){
		super()
		game.say(self,"ingresa para combatir")
	}
	
}