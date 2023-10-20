import personaje.*
import wollok.game.*
import pokemons.*


// Cura a todos los pokemones 
object superPoti {
	const efecto = 60
	const property precio = 100
	
	//method usar(pokemon){
	//	self.validacion()
	//	pokemon.aumentarVida(efecto)}
	
	method validacion(){
		if (not personaje.inventario().contains(self)){
			self.error("No tenes superPotis!!")
		}
	}
	
	method usar(){
		self.validacion()
		game.say(personaje.pokemon(),"Has usado una superpoti")
		personaje.inventario().remove(self)
		personaje.propios().forEach({poke=>poke.aumentarVida(efecto)})
		game.say(personaje.pokemon(),"Vida:" + personaje.pokemon().vida().toString())
	}
	
}
// Cura solo al que estas usando
object poti{
	const efecto = 30
	const property precio = 40
	
	method validacion(){
		if (not personaje.inventario().contains(self)){
			self.error("No tenes potis!!")
		}
	}
	method usar(pokemon){
		self.validacion()
		game.say(personaje.pokemon(),"Has usado una poti")
		pokemon.aumentarVida(efecto)
		
	}
}

object pokebola{
	const property precio = 40
	
	method usar(pokemon){
		
	}
}