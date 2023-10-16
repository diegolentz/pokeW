import wollok.game.*
import config.*
import personaje.*
import edificios.*
import city.*
import arbol.*

class Pokemon{
	var property vida = 200
	var property nivel = 4
	
	//const ataques = [0,1,2]
	//var ataque = self.atacar()

	method atacar(){
		var ataque = 0.randomUpTo(3).truncate(0)
		
		return self.autoattack(ataque)
		
		}
	
	method autoattack(ataque){
		 if(ataque == 0){
			return self.ataqueMin()
		}else if(ataque == 1){
			return self.ataqueMed()
		}else {return self.ataqueAlt()}
	}
	
	//EL METODO "atacado" ES SOBRE AL POKEMON QUE SE LE VA A RESTAR VIDA
	//POR ULTIMO ENVIA EL MENSAJE DE TURNO PARA REALIZAR EL CAMBIO DE TURNO
	method atacado(damage) {
		vida = vida - damage
		gimnasio.turno()
	}
	 
	method ataqueMin() = nivel * 10  	
	
	method ataqueMed() = nivel * 15 
		
	method ataqueAlt() = nivel * 20
	
}

class Blastoise inherits Pokemon {
	const property nombreAtaques = ["punetazo","chorro de agua","hidrobomba"]
	var property position = game.at(15,11)	
	var property image = "blastoise.png"
	
}
class MewTwo inherits Pokemon {
	
	
}
class Machamp inherits Pokemon {
	var property position = game.at(15,11)	
	var property image = "machamp.png"
	
}
class Charmileon inherits Pokemon {
 	var property position = game.at(7,5)	
	var property image = "charmileon.png"
	
}