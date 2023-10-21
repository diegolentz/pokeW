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
	method pokemon() = pokemones.first()
}

object personaje inherits Human{
    var property position = game.at(2,12)
    var property image = "player_Up.png"
    var property posicionAnterior = game.at(2, 12)   
    
      var property oro = 1000
      const property potis = #{poti,poti}
      const property superPotis = #{superPoti}
      const property pokebolas = #{pokebola}
       
    
    //POKEMONES, CREO NUEVOS POKEMONES Y VAN A RECIBIR SU POSICION EN BASE SI
    //ES RIVAL O PERSONAJE

   	const charmileon =  new Charmileon(position = self.positionPokemon())
   	const mewTwo = new MewTwo(position = self.positionPokemon())
   	const hunter = new Hunter(position = self.positionPokemon())
   	const pikachu = new Pikachu(position = self.positionPokemon()) 

   	//LISTA DE POKEMONES PROPIOS DEL PERSONAJE
   	const property propios = #{charmileon}
   
   //RETORNA LA POSICION DEL POKEMON ALIADO
   method positionPokemon() = game.at(8,1)
   
   method venderItem(tipo,item){
		if (tipo.contains(item)) {
		    game.say(enfermera,"vendiste " + item)
			oro += item.precio()
		    tipo.remove(item)
    	}else{
	    	self.error("No tenes este item")	
    	}
	}
    	
    
    method comprarItem(tipo,item) {
    if (oro >= item.precio()) {
      game.say(enfermera,"compraste " + item)
      tipo.add(item)
      oro -= item.precio()
    }else{
    	self.error("oro insuficiente")
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
	
	method recompensa(cash) {
		oro += cash
		return cash
	}
}


object rival inherits Human{
    var property position = game.at(22,9)
    var property image = "enemigoBatalla.png"

    //POKEMONES, CREO NUEVOS POKEMONES Y VAN A RECIBIR SU POSICION EN BASE SI
    //ES RIVAL O PERSONAJE

    const machamp   = new Machamp  (position = self.positionPokemon(), nivel= 5)
    const blastoise = new Blastoise(position = self.positionPokemon(), nivel = 5)
    const onix      = new Onix     (position = self.positionPokemon(), nivel = 5)

    const property propios = #{onix,machamp,blastoise}
    //RETORNA LA POSICION DEL POKEMON ENEMIGO

    method positionPokemon() = game.at(17,7)
}

object enfermera{
   var property position = game.at(12,8)
    var property image = "enfermera.png"
   
}
object pisoCombat inherits Human{
	var property position = game.at(17,7)
	const property propios = #{self.aleatorio()}
	
	//DEVUELVE EL POKEMON RETORNADO DEL METODO elegir ATRAVEZ DE UN NUMERO ALEATORIO
	method aleatorio() = self.elejir(self.valorAleatorio())
	
	//RETORNA UN NUMERO ALEATORIO DEL 0 AL 5
	method valorAleatorio() = 0.randomUpTo(5).truncate(0)
	
	//FUNCION QUE RETORNA UN NUEVO POKEMON SEGUN EL NUMERO
	method elejir(valor){
		if(valor == 0){
			return new Pidgeotto(position = position)
		}else if(valor == 1){
			return new Kadabra(position = position)
		}else if(valor == 2){
			return  new Hunter(position = position)
		}else if(valor == 3){
			return new Dragonair(position = position)
		}else if(valor == 4){
			return new Pikachu(position = position)
		}else { return new MewTwo(position = position)}
		
	}
	
	method position() = game.at(17,7)
}