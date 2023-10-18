import wollok.game.*
import config.*
import pokemons.*
import edificios.*
import objectos.*

class Human{
	const property pokemones = []

	//AGREGA LOS POKEMONES PROPIOS 
	//DE CADA PERSONAJE A SU JUGADOR CORRESPONDIENTE	
	method iniciaBatalla(propios){
	    pokemones.addAll(propios)
	}
	//RETORNA EL PRIMER POKEMON 
	//DE LA LISTA DE CADA PERSONAJE
	method pokemon() = pokemones.head()
}

object personaje inherits Human{
    var property position = game.at(2,12)
    var property image = "player_Up.png"
    var property posicionAnterior = game.at(2, 12)   
 
    var property oro = 100
    var property inventario = [poti] 
    
    //POKEMONES, CREO NUEVOS POKEMONES Y VAN A RECIBIR SU POSICION EN BASE SI
    //ES RIVAL O PERSONAJE
   	const machop= new Machop(position = self.positionPokemon())
   	const charmileon =  new Charmileon(position = self.positionPokemon())
   	//const onix=  new Onix(position = self.positionPokemon())
   	//LISTA DE POKEMONES PROPIOS DEL PERSONAJE
   	const property propios = #{charmileon,machop}
   
   //RETORNA LA POSICION DEL POKEMON ALIADO
   	method positionPokemon() = game.at(7,5)
   	
 
    
    method venderItem(item){
    	if (inventario.contains(item)) {
      oro += item.precio()
      inventario.remove(item)
      game.say(enfermera,"Oro restante:" + self.oro())
      game.say(enfermera,"Has vendido" + item)
    	}else{
    		self.error("No tenes este item:" + item + "para vender")	
    	}
    }
    
    method comprarItem(item) {
    if (oro >= item.precio()) {
      oro -= item.precio()
      inventario.add(item)
      game.say(enfermera,"Has comprado una" + item + "gastando" + item.precio())
    }else{
    	self.error("No tenes oro para comprar" + item)
    }
  }
  
    method irA(nuevaPosicion) {
		posicionAnterior = position
       	position = nuevaPosicion         
    }
	
	method pos() {
		game.say(self,position)
	}
	method iniciaMarket(){}

}


object rival inherits Human{
    var property position = game.at(20,12)
    var property image = "enemigoBatalla.png"
    //POKEMONES, CREO NUEVOS POKEMONES Y VAN A RECIBIR SU POSICION EN BASE SI
    //ES RIVAL O PERSONAJE
    const machamp = new Machamp(position = self.positionPokemon())
    const blastoise = new Blastoise(position = self.positionPokemon())
    const pidgey = new Pidgey(position = self.positionPokemon())
    //LISTA DE POKEMONES PROPIOS DEL PERSONAJE
    const property propios = #{machamp,blastoise,pidgey}
    
    
    //RETORNA LA POSICION DEL POKEMON ENEMIGO
    method positionPokemon() = game.at(15,11)
  
}


object enfermera{
   var property position = game.at(12,8)
    var property image = "enfermera.png"
    
   
}