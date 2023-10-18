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
	var property estado = 0
	
	
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
	method atacado(damage,edificio) {
		vida = vida - damage
		edificio.turno()
		//return vida
	}
	 
	method ataqueMin() = nivel * 10  	
	
	method ataqueMed() = nivel * 15 
		
	method ataqueAlt() = nivel * 20
	
}

//del rival
class Blastoise inherits Pokemon {
	method image() = "blastoise_" + estado + ".png"
	
}
class Machamp inherits Pokemon {
	method image() = "machamp_" + estado + ".png"
}
class Onix inherits Pokemon {
	method image() = "onix_" + estado + ".png"
}

//mio
class Charmileon inherits Pokemon {
	method image() = "charmileon_" + estado + ".png"
}

//pokemones de piso
class Pidgeotto inherits Pokemon {
	method image() = "pidgeotto_" + estado + ".png"
}
class Kadabra inherits Pokemon {
	method image() = "kadabra_" + estado + ".png"
}	
class Hunter inherits Pokemon {
	method image() = "haunter_" + estado + ".png"
}
class Dragonair inherits Pokemon {
	method image() = "dragonair_" + estado + ".png"
}
class Pikachu inherits Pokemon {
	method image() = "pikachu_" + estado + ".png"
}
class MewTwo inherits Pokemon {
	method image() = "mewtwo_" + estado + ".png"
}


