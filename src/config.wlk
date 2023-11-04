import city.*
import personaje.*
import wollok.game.*
import arbol.*
import edificios.*
import pokemons.*
import objectos.*

object config {
	
	method iniciar(){
	
		self.configurarTeclas()
		
		self.aparezcanObjetos()
		
}	
		
	method configurarTeclas(){
		keyboard.left().onPressDo({personaje.irA(personaje.position().left(2)) personaje.image("player_Left.png")})
		keyboard.right().onPressDo({personaje.irA(personaje.position().right(2)) personaje.image("player_Right.png")})
		keyboard.up().onPressDo({personaje.irA(personaje.position().up(2)) personaje.image("player_Up.png")})
		keyboard.down().onPressDo({personaje.irA(personaje.position().down(2)) personaje.image("assets//player_Down.png")})
}
	
	method teclasMercado(){
		keyboard.num1().onPressDo({personaje.comprarItem(personaje.potis(),poti)})	
		keyboard.num2().onPressDo({personaje.comprarItem(personaje.superPotis(),superPoti)})
		keyboard.num3().onPressDo({personaje.comprarItem(personaje.pokebolas(),pokebola)})
		keyboard.num4().onPressDo({personaje.venderItem(personaje.potis(),poti)})
		keyboard.num5().onPressDo({personaje.venderItem(personaje.superPotis(),superPoti)})
		keyboard.e().onPressDo({game.clear()
		self.iniciar()})
	}
	
	method aparezcanObjetos(){
		//Objetos en el mapa-------------------------------------------------------------------------------------------
		
		game.addVisual(new City())
		mapa.aparecerArboles()
		mapa.aparecerArbolesInvicibles()
		mapa.posicionesPiso()
		
		game.addVisual( new Gimnasio(position = game.at(2,16),enemigo = rival))
		
		game.addVisual(new Centro(position = game.at(24,8)))
		
		game.addVisual( new CartelGym(position = game.at(4,14)))
	
		game.addVisual(new CartelMarket(position = game.at(22,10)))	
		
		game.addVisual(personaje)
		
		game.onCollideDo(personaje, { algo => algo.teEncontro()})
	}
	
}

object mapa{
	
	method posicionesArboles() = [[0, 0], [2, 0], [4, 0], [6, 0], [8, 0], [10, 0],[12, 0], [14, 0], [16, 0], [18, 0], [20, 0],[22, 0], [24, 0], [24, 2], [24, 4], [24, 6], [24, 12], [24, 14], [24, 16], [22, 16], [20, 16],[18, 16], [16, 16], [14, 16], [12, 16], [10, 16],[8, 16], [6, 16], [0, 16], [0, 14], [0, 12],[0, 10], [0, 8], [0, 6], [2, 6], [4, 6], [6, 6],[8, 6], [10, 6], [12, 6], [14, 6], [16, 6]]
	 
	method aparecerArboles() =self.posicionesArboles().forEach { posicion =>game.addVisual(new Arbol(position = game.at(posicion.first(), posicion.last())))} 
	
	method arbolesInvisibles() = [[24, 10], [4, 16], [0, 2],[0, 4]]

	method aparecerArbolesInvicibles() = self.arbolesInvisibles().forEach { data =>game.addVisual(new ArbolInvisible(position = game.at(data.first(), data.last())))}
	
	method posiciones() = [[6, 4], [12, 2], [18, 4], [20, 10], [22, 14],[12, 8], [8, 12], [2, 10], [4, 2], [14, 12]]

	method posicionesPiso() = self.posiciones().forEach { pos =>game.addVisual(new IconPiso(position = game.at(pos.first(), pos.last()),enemigo = pisoCombat))}
	
}

object gimnasio inherits Gimnasio(enemigo = rival){
	
	override method position() = game.at(0,0)

	method iniciar(){
		if(self.noPuedenEntrar()){
			self.salir()
			game.say(personaje, "perdistes")
			game.onTick(1000, "SALIENDO", {game.stop()})
		}else{
			self.preparar()
			self.pelea()		
		} 
	}
	
	method preparar(){
		game.addVisual(new Batalla())
		game.addVisual(cartelDePelea)	
		game.addVisual(personaje)
		game.addVisual(rival)
	}
}

object piso inherits IconPiso(enemigo = pisoCombat){
	
	method iniciar(){
		if(self.noPuedenEntrar()){
			self.salir()
			game.say(personaje, "perdistes")
			game.onTick(1000, "SALIENDO", {game.stop()})
		}else{
		self.preparar()
		self.pelea() 
		}
	}	 
	
	method preparar(){
		game.addVisual(new PeleaPiso())
		game.addVisual(pisoCombat)
		game.addVisual(cartelDePelea)
	}
}

object market inherits Centro{
	
	method iniciar() {
		config.teclasMercado()
		self.preparar()	
		self.mostrarMensajes()
	}
	
	method preparar(){
		game.addVisual(new Market())
		game.addVisual(enfermera)
		game.addVisual(cartelDeCompra)
		
	}
	
}