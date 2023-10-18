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
		if (not personaje.inventario().contain(self)){
			self.error("No tenes superPotis!!")
		}
	}
	
	method usar(pokemon){
		self.validacion()
		personaje.propios().forEach({pokemons=>pokemon.aumentarVida(efecto)})
	}
	
}
// Cura solo al que estas usando
object poti{
	const efecto = 30
	const property precio = 40
	
	method validacion(){
		if (not personaje.inventario().contain(self)){
			self.error("No tenes potis!!")
		}
	}
	method usar(pokemon){
		self.validacion()
		pokemon.aumentarVida(efecto)
		
	}
}

object pokebola{
	const property precio = 40
	
	method usar(pokemon){
		
	}
}


