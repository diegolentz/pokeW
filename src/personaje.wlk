import wollok.game.*
import config.*
import pokemons.*
import objectos.*

class UserException inherits Exception { }


class Human{
	const property pokemones = []

	//AGREGA LOS POKEMONES PROPIOS DE CADA PERSONAJE A SU JUGADOR CORRESPONDIENTE	
	method iniciaBatalla(propios){
		
		pokemones.addAll(propios)
	}
	
	//RETORNA EL PRIMER POKEMON DE LA LISTA DE CADA PERSONAJE
	method pokemon() {
		if(!self.tienePokemon()){
			 throw new UserException(message = "Pelea terminada!")
		}
			return pokemones.first()
	}
	method tienePokemon() = pokemones.size() > 0
	
}

object personaje inherits Human{
    var property position = game.at(2,4)
    var property posicionAnterior = game.at(2, 4)   
    var property image = "player_Up.png"
    
     var property oro = 100
     const property potis = [poti,poti]
     const property superPotis = [superPoti]
     const property pokebolas = [pokebola]
       
    
    //POKEMONES, CREO NUEVOS POKEMONES Y VAN A RECIBIR SU POSICION EN BASE SI
    //ES RIVAL O PERSONAJE

   	const charmileon =  new Charmileon(position = self.positionPokemon()) 

   	//LISTA DE POKEMONES PROPIOS DEL PERSONAJE
   	const property propios = #{charmileon}
   
   //RETORNA LA POSICION DEL POKEMON ALIADO
   method positionPokemon() = game.at(8,1)
   
   method validacionVenta(tipo,item) =tipo.contains(item)
   
   method venderItem(tipo,item){
		if (not self.validacionVenta(tipo,item)) {
	    	self.error("No tenes este item")	
    	}
		game.say(enfermera,"vendiste " + item)
		self.vendio(tipo,item)
	}
   	
   	method vendio(tipo,item){
		oro += item.precio()
	    tipo.remove(item)
   	}
   	
   	method validarCompra(item) = oro >= item.precio()
    
    method comprarItem(tipo,item) {
	    if (not self.validarCompra(item)) {
			self.error("oro insuficiente")
    	}
	    game.say(enfermera,"compraste " + item)
	    self.compro(tipo,item)
  }
  
  method compro(tipo,item){
	   tipo.add(item)
	   oro -=  item.precio()
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
	}
}


object rival inherits Human{
    var property image = "enemigoBatalla.png"

    //POKEMONES, CREO NUEVOS POKEMONES Y VAN A RECIBIR SU POSICION EN BASE SI
    //ES RIVAL O PERSONAJE

    const machamp   = new Machamp  (position = self.positionPokemon(), nivel= 7)
    const blastoise = new Blastoise(position = self.positionPokemon(), nivel = 7)
    const onix      = new Onix     (position = self.positionPokemon(), nivel = 7)

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
	const property propios = #{self.lista().anyOne()}
	method position() = game.at(17,7)
	
	method lista() = [self.pidgeotto(),self.kadabra(),self.hunter(),self.dragonair(),self.picachu()]
	method pidgeotto() =new Pidgeotto(position = self.position() ,estado = 0)
	method kadabra() = new Kadabra(position = self.position(),estado = 0)
	method hunter() = new Hunter(position = self.position(),estado = 0)
	method dragonair() = new Dragonair(position = self.position(),estado = 0)
	method picachu() = new Pikachu(position = self.position(),estado = 0)
	
}