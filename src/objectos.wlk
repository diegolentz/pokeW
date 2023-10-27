import personaje.*
import wollok.game.*
import pokemons.*
import config.*


// Cura a todos los pokemones 
object superPoti {
	const efecto = 60
	method precio() = 100
	
	method validacion(){
		if (personaje.superPotis().isEmpty()){
			self.error("No tenes superPotis!!")
		}
	}
	
	method usar(){
		self.validacion()
		game.say(personaje.pokemon(),"Has usado una superpoti")
		personaje.superPotis().remove(self)
		personaje.propios().forEach({poke=>poke.aumentarVida(efecto)})
		game.say(personaje.pokemon(),"Vida:" + personaje.pokemon().vida().toString())
	}
}

// Cura solo al que estas usando
object poti{
	const efecto = 30
	
	method  precio() = 40
	
	method validacion(){
		if (self.tiene()){
			self.error("No tenes potis!!")
		}
	}
	
	method tiene() = personaje.potis().isEmpty()
	
	method usar(pokemon){
		self.validacion()
		personaje.potis().remove(self)
		game.say(personaje.pokemon(),"Has usado una poti")
		pokemon.aumentarVida(efecto)
	}
}

object pokebola{
	
	method precio() = 40
	
	method puedeAtrapar(alguien) =  alguien.vida() < 210 and personaje.pokebolas().size() > 0
	
	method usar(alguien){
			game.removeVisual(alguien)
			//ELIMINO AL POKEMON DEL ARRAY DEL ENEMIGO pokePiso
			pisoCombat.pokemones().remove(alguien)
			//pisoCombat.propios().remove(alguien)
			alguien.position(personaje.positionPokemon())
			//AGREGO AL POKEMON DEL PISO EN MI ARRAY 
			alguien.estado(1)
			personaje.propios().add(alguien)
			
			piso.salir()
	}
	
	
}	
	