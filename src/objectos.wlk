import personaje.*
import wollok.game.*
import pokemons.*
import config.*

class Item {
    var property precio = 0

    method validacion(item) {
        if (self.tiene(item)) {
            self.error("No tienes este ítem.")
        }
    }
    method tiene(item) = false
    method usar(pokemon) {
        self.validacion(self)
        self.efecto(pokemon)
    }
    method efecto(pokemon) {
        game.say(personaje.pokemon(), "Has usado una cura")
        game.say(personaje.pokemon(), "Vida:" + personaje.pokemon().vida().toString())
    }
}

object superPoti inherits Item(precio = 100) {
    const efecto = 60

    override method precio() = 100
    override method tiene(item) = !personaje.superPotis().contains(item)
    override method efecto(pokemon) {
    	super(pokemon)
        personaje.superPotis().remove(self)
        personaje.propios().forEach({ poke => poke.aumentarVida(efecto) })
    }
}
object poti inherits Item {
    const efecto = 30

    override method precio() = 40
    override method tiene(item) = !personaje.potis().contains(item)
    override method efecto(pokemon) {
    	super(pokemon)
        personaje.potis().remove(self)
        pokemon.aumentarVida(efecto)
    }
}
object pokebola inherits Item(precio = 40){

    method puedeAtrapar(alguien) = self.alcanzaVida(alguien) and self.alcanzaPokebolas(alguien)
    override method usar(alguien) {
    	personaje.pokebolas().remove(personaje.pokebolas().head())
        game.removeVisual(alguien)
        pisoCombat.pokemones().remove(alguien)
        alguien.position(personaje.positionPokemon())
        alguien.estado(1)
        personaje.propios().add(alguien)
        piso.salir()
    }
    method alcanzaVida(alguien) = alguien.vida() < 90
    method alcanzaPokebolas(alguien) = personaje.pokebolas().size() > 0
}