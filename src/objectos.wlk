import personaje.*
import wollok.game.*
import pokemons.*
import config.*


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
			//ASIGNO LA POSICION AL POKEMON QUE ATRAPE A LA POSICION DE MIS POKEMONS
			alguien.position(personaje.positionPokemon())
			//nuevo.estado(1)
			//REMUEVO EL LA VISUAL DEL POKEMON DEL PISO
			game.removeVisual(alguien)
			//ELIMINO AL POKEMON DEL ARRAY DEL ENEMIGO pokePiso
			pisoCombat.pokemones().remove(alguien)
			
			//AGREGO AL POKEMON DEL PISO EN MI ARRAY 
			personaje.propios().add(alguien)
			piso.salir()
	}
}
	
	/*
	 
	 
	method crearpoKemon(alguien) {
		
		
			if (alguien.toString() == "pidgeotto"){
				const pokemon = new Pidgeotto(position = game.at(8,1), estado = 1)
			}else if(alguien.toString() == "kadabra"){
				const pokemon = new Kadabra(position = game.at(8,1), estado = 1)
			}else if(alguien.toString() == "hunter"){
				const pokemon = new Hunter(position = game.at(8,1), estado = 1)
			}else if(alguien.toString() == "dragonair"){
				const pokemon= new Dragonair(position = game.at(8,1), estado = 1)		
			}else if(alguien.toString() == "pikachu"){
				const pokemon= new Pikachu(position = game.at(8,1), estado = 1)
			}else{ 
				const pokemon = new MewTwo(position = game.at(8,1), estado = 1)
			}
			return pokemon
	}
	 */
