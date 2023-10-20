
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
	
	method usar(pokemon){
		self.validacion()
		game.say(personaje.pokemon(),"Has usado una superpoti")
		personaje.propios().forEach({pokemons=>pokemon.aumentarVida(efecto)})
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
		game.say(personaje.pokemon(),"Has usado una pocion")
		pokemon.aumentarVida(efecto)
		personaje.inventario().remove(self)
		game.say(personaje.pokemon(),"Vida:" + personaje.pokemon().vida().toString())
		
	}
}

object pokebola{
	const property precio = 40
	
	method validacion(){
		if (not personaje.inventario().contains(self)){
			self.error("No tenes pokebolas!!")
		}
	}
	
	method validacionVida(pokemon){
		if (not pokemon.vida()<= 0){
			self.error("Sigue vivo!!")
		}
	}
	
	method atrapado(pokemon){
		
		personaje.inventario().add(pokemon)
	}
	
	method usar(pokemon){
		self.validacion()
		self.validacionVida(pokemon)
		game.say(personaje.pokemon(),"Has usado la pokebola")
		self.atrapado(pokemon)
	}
}



