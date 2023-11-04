import wollok.game.*
import config.*
import personaje.*
import edificios.*
import city.*
import arbol.*

class Pokemon{
	var property vida = 100
	var property nivel = 4
	var property position
	var property estado = 0
	const property poderes = [ataqueMin,ataqueMed,ataqueAlt]
		
	method atacar() = poderes.anyOne().poder()
	
	method elegirAtaque(poder) = poderes.get(poder).poder()
	
	method muerto() = self.vida()<=0	 
	 
	//EL METODO "atacado" ES SOBRE AL POKEMON QUE SE LE VA A RESTAR VIDA
	//POR ULTIMO ENVIA EL MENSAJE DE TURNO PARA REALIZAR EL CAMBIO DE TURNO
	 method atacado(damage) {
        if (!self.muerto()) {
            vida = vida - damage
        } 
	}


 
 	method sube(pokemon){
 		nivel =nivel + 1
 		if(self.evolucion(pokemon) ){
 			pokemon.estado(2)
 		}
 	}
 	
	 method evoluciona(elmio){
	 	if(self.evolucion(elmio)){
	 		elmio.estado(2)
	 		game.say(self,"evolucione vieja!")
	 	}
	 }
	 
	method evolucion(pokemon) = pokemon.nivel() >= 5 
	
	method aumentarVida(efecto){vida = vida + efecto}
	
}

object ataqueMin{
	method poder() = 10  
}

object ataqueMed{
	method poder() = 15 
}

object ataqueAlt{
	method poder() = 20 
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