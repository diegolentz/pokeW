import personaje.*
import wollok.game.*
import pokemons.*

// Cura a todos los pokemones 
object superPoti {
	const efecto = 60
	const property precio = 100
	
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
	const property precio = 40
	
	method validacion(){
		if (personaje.potis().isEmpty()){
			self.error("No tenes potis!!")
		}
	}
	method usar(pokemon){
		self.validacion()
		personaje.potis().remove(self)
		game.say(personaje.pokemon(),"Has usado una poti")
		pokemon.aumentarVida(efecto)
	}
}

object pokebola{
	const property precio = 40
	
	method puedeAtrapar(alguien) =  alguien.vida() > 10 and personaje.pokebolas().size() > 0
	
	method usar(alguien){
			game.removeVisual(alguien)
			pisoCombat.pokemones().remove(alguien)
			alguien.estado(1)
			alguien.position(personaje.positionPokemon())
			personaje.propios().add(alguien)
	}
}
