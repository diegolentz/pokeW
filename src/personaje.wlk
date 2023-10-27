import wollok.game.*
import config.*
import pokemons.*
import objectos.*

class Human{
	const property pokemones = []

	//AGREGA LOS POKEMONES PROPIOS DE CADA PERSONAJE A SU JUGADOR CORRESPONDIENTE	
	method iniciaBatalla(propios){pokemones.addAll(propios)}
	
	//RETORNA EL PRIMER POKEMON DE LA LISTA DE CADA PERSONAJE
	method pokemon() = pokemones.first()
	
}

object personaje inherits Human{
    var property position = game.at(2,12)
    var property posicionAnterior = game.at(2, 12)   
    var property image = "player_Up.png"
    
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
   	const property propios = #{charmileon,mewTwo,hunter,pikachu}
    
   
   //RETORNA LA POSICION DEL POKEMON ALIADO
   method positionPokemon() = game.at(8,1)
   
   method validacionVenta(tipo,item) =tipo.contains(item)
   
   method venderItem(tipo,item){
		if (self.validacionVenta(tipo,item)) {
		    game.say(enfermera,"vendiste " + item)
			oro += item.precio()
		    tipo.remove(item)
    	}else{
	    	self.error("No tenes este item")	
    	}
	}
   	
   	method validarCompra(item) = oro >= item.precio()
    
    method comprarItem(tipo,item) {
	    if (self.validarCompra(item)) {
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
    var property image = "enemigoBatalla.png"

    //POKEMONES, CREO NUEVOS POKEMONES Y VAN A RECIBIR SU POSICION EN BASE SI
    //ES RIVAL O PERSONAJE

    const machamp   = new Machamp  (position = self.positionPokemon(), nivel= 5)
    const blastoise = new Blastoise(position = self.positionPokemon(), nivel = 5)
    const onix      = new Onix     (position = self.positionPokemon(), nivel = 5)

    const property propios = #{onix,machamp,blastoise}
    //RETORNA LA POSICION DEL POKEMON ENEMIGO

    method position() = game.at(22,9)
    method positionPokemon() = game.at(17,7)
}

object enfermera{
	
   method position() = game.at(12,8)
   method image() = "enfermera.png"
   
}
object pisoCombat inherits Human{
	
	const property lista = [self.pidgeotto(),self.kadabra(),self.hunter(),self.dragonair(),self.picachu()]
	const property propios = #{lista.anyOne()}
	
	method pidgeotto() =new Pidgeotto(position = self.position())
	method kadabra() = new Kadabra(position = self.position())
	method hunter() = new Hunter(position = self.position())
	method dragonair() = new Dragonair(position = self.position())
	method picachu() = new Pikachu(position = self.position())
	
	method position() = game.at(17,7)
}