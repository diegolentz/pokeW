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
	
	const city = new City()
	
	game.addVisual(city)
	
	game.addVisual(personaje)
	
	
	//arboles-------------------------------------------------------------------------------------------
	
	const posicionesArboles = [
    [0, 0], [2, 0], [4, 0], [6, 0], [8, 0], [10, 0],
    [12, 0], [14, 0], [16, 0], [18, 0], [20, 0],
    [22, 0], [24, 0], [24, 2], [24, 4], [24, 6],
    [24, 12], [24, 14], [24, 16], [22, 16], [20, 16],
    [18, 16], [16, 16], [14, 16], [12, 16], [10, 16],
    [8, 16], [6, 16], [0, 16], [0, 14], [0, 12],
    [0, 10], [0, 8], [0, 6], [2, 6], [4, 6], [6, 6],
    [8, 6], [10, 6], [12, 6], [14, 6], [16, 6]]

	posicionesArboles.forEach { posicion =>const arbol = new Arbol(position = game.at(posicion.first(), posicion.last()))
		game.addVisual(arbol)
	}

	//edificios-------------------------------------------------------------------------------------------
	
	const gim = new Gimnasio(
		position = game.at(2,16),
		enemigo = rival
	)
	game.addVisual(gim)
	const cen = new Centro(
		position = game.at(24,8)
	)
	game.addVisual(cen)
	
	//carteles-------------------------------------------------------------------------------------------
	const c1 = new CartelGym(
		position = game.at(4,14)
	)
	game.addVisual(c1)
		const c2 = new CartelMarket(
		position = game.at(22,10)
	)
	game.addVisual(c2)
	
	//invisible-------------------------------------------------------------------------------------------
	
	const arbolesInvisibles = [[24, 10],
							    [4, 16],
							    [0, 2],
							    [0, 4]]

	arbolesInvisibles.forEach { data =>
		    const invisible = new ArbolInvisible(
	        position = game.at(data.first(), data.last()))
	    	game.addVisual(invisible)}
	
	
	// batalla piso---------------------------------------------------------------------------------------
	
	const posiciones = [[6, 4], [12, 2], [18, 4], [20, 10], [22, 14],
					    [12, 8], [8, 12], [2, 10], [4, 2], [14, 12]]

	posiciones.forEach { pos =>
	    const piso = new IconPiso(position = game.at(pos.first(), pos.last()),enemigo = pisoCombat)
	    game.addVisualIn(piso, piso.position())}

	game.onCollideDo(personaje, { algo => algo.teEncontro()})
}	
		
	method configurarTeclas(){
		keyboard.left().onPressDo({personaje.irA(personaje.position().left(2))})
		keyboard.left().onPressDo({personaje.image("player_Left.png")})		
		
		
		keyboard.right().onPressDo({personaje.irA(personaje.position().right(2))})
		keyboard.right().onPressDo({personaje.image("player_Right.png")})		
	
	
		keyboard.up().onPressDo({personaje.irA(personaje.position().up(2))})
		keyboard.up().onPressDo({personaje.image("player_Up.png")})		
	
	
		keyboard.down().onPressDo({personaje.irA(personaje.position().down(2))})
		keyboard.down().onPressDo({personaje.image("assets//player_Down.png")})		
	
		keyboard.p().onPressDo({personaje.pos()})
	}
	
	method teclasMercado(){
				keyboard.num1().onPressDo({
				personaje.comprarItem(personaje.potis(),poti)
			})
				keyboard.num2().onPressDo({
				personaje.comprarItem(personaje.superPotis(),superPoti)
			})
				keyboard.num3().onPressDo({
				personaje.comprarItem(personaje.pokebolas(),pokebola)
			})
			keyboard.num4().onPressDo({
				personaje.venderItem(personaje.potis(),poti)
			})
			keyboard.num5().onPressDo({
				personaje.venderItem(personaje.superPotis(),superPoti)
			})
			keyboard.e().onPressDo({
				game.clear()
				self.iniciar()
			})
	}
	
}

object gimnasio inherits Gimnasio(enemigo = rival){
	
	override method position() = game.at(0,0)
	
	method iniciar(){
		const batalla = new Batalla()
		
		game.addVisual(self)
		game.addVisual(personaje)
		game.addVisual(batalla)
		game.addVisual(rival)	
		
		if(self.estanTodosMuertos(personaje)){
			self.salir()
		}
		self.pelea()
	}
}

object piso inherits IconPiso(enemigo = pisoCombat){
	
	method iniciar(){
		
		const piso = new PeleaPiso()
		
		game.addVisual(piso)
		game.addVisual(pisoCombat)
		if(self.estanTodosMuertos(personaje)){
			self.salir()
		}
		self.pelea()  
	}
}

object market inherits Centro{
	
	method iniciar(){
		
		const market = new Market(
		/*position = game.at(0,0)*/)
	
	game.addVisual(market)
	game.addVisual(enfermera)
	config.teclasMercado()
	self.mostrarPrecios()	
	}
}