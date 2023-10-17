import wollok.game.*
import config.*
import personaje.*
import edificios.*
import city.*
import arbol.*

class Pokemon{
	var property vida = 200
	var property nivel = 4
	var property position
	
	
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
	//const property nombreAtaques = ["punetazo","chorro de agua","hidrobomba"]	
	var property image = "blastoise.png"
	
}
class Pidgey inherits Pokemon {
	var property image = "pidgey.png"
}

class Machop inherits Pokemon {
	var property image = "machop.png"	
}

class Machamp inherits Pokemon {
	var property image = "machamp.png"	
}

class Charmileon inherits Pokemon {
	var property image = "charmileon.png"	
}

class Charmander inherits Pokemon {
	var property image = "charmander.png"
	
}

class Onix inherits Pokemon {
	var property image = "onix.png"
}

