import wollok.game.*
import config.*
import personaje.*

class Arbol {
    
    var property position = 0

    method image() = "arbol.png"
    
    method teEncontro() {
        personaje.position(personaje.posicionAnterior())
    }
}

class ArbolInvisible inherits Arbol {
   	
   	override method image() = "arbolInvisible.png"
   	
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

object cartelDeCompra{
	 method image() = "cartelDeCompras.png"
	
	 method position() = game.at(13,1)
}

object cartelDePelea{
	 method image() = "cartelDePelea.png"
	
	 method position() = game.at(17,1)
}