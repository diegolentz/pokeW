import wollok.game.*
import config.*
import pokemons.*
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
    var property inventario = [poti,superPoti,poti] 
    
    //POKEMONES, CREO NUEVOS POKEMONES Y VAN A RECIBIR SU POSICION EN BASE SI
    //ES RIVAL O PERSONAJE

   	const charmileon =  new Charmileon(position = self.positionPokemon())
   	const mewTwo = new MewTwo(position = self.positionPokemon())
   	const hunter = new Hunter(position = self.positionPokemon())
   	const pikachu = new Pikachu(position = self.positionPokemon()) 

   	//LISTA DE POKEMONES PROPIOS DEL PERSONAJE
   	const property propios = #{charmileon,mewTwo,hunter,pikachu}
   
   //RETORNA LA POSICION DEL POKEMON ALIADO
   method positionPokemon() = game.at(8,1)
   
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
    var property position = game.at(22,9)
    var property image = "enemigoBatalla.png"

    //POKEMONES, CREO NUEVOS POKEMONES Y VAN A RECIBIR SU POSICION EN BASE SI
    //ES RIVAL O PERSONAJE

    const machamp   = new Machamp  (position = self.positionPokemon())
    const blastoise = new Blastoise(position = self.positionPokemon())
    const onix      = new Onix     (position = self.positionPokemon())

    const property propios = #{onix,machamp,blastoise}
    //RETORNA LA POSICION DEL POKEMON ENEMIGO

    method positionPokemon() = game.at(17,7)
/*
   method revive(){
   	self.pokemones().forEach({pokemon => pokemon.vida(200)})
   }
*/  
}


object enfermera{
   var property position = game.at(12,8)
    var property image = "enfermera.png"
    
   
}
object pisoCombat inherits Human{
	 var property position = game.at(17,7)
	
	//instancio todos los pokemones
	const pidgeotto = new Pidgeotto(position = position)
	const kadabra = new Kadabra(position = position)
	const hunter = new Hunter(position = position)
	const dragonair = new Dragonair(position = position)
	const pikachu = new Pikachu(position = position)
	const mewTwo = new MewTwo(position = position)
	
	
	
	const property propios = #{self.aleatorio()}
	

	//var propios = propiosPiso{2}
	method aleatorio(){
		var valor = 0.randomUpTo(5).truncate(0)
		var elejido = self.elejir(valor)
		return elejido
	}
		
	method elejir(valor){
		var elejido
		if(valor == 0){
			elejido = pidgeotto
		}else if(valor == 1){
			elejido = kadabra
		}else if(valor == 2){
			elejido = hunter
		}else if(valor == 3){
			elejido = dragonair
		}else if(valor == 4){
			elejido = pikachu
		}else {elejido = mewTwo}
		return elejido
	}
	
	method position() = game.at(17,7)

}