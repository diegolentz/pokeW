import wollok.game.*
import config.*
import personaje.*




class Arbol{
	var property image = "arbol.png"
	var property position = 0 
	
	method teEncontro(){
		personaje.position(personaje.posicionAnterior()) 
		game.say(personaje,"cuidado el arbol")
	}	
}
	
	