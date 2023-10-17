import city.*
import personaje.*
import wollok.game.*
import arbol.*
import edificios.*
import pokemons.*

object config {
	
	method iniciar(){
	
	self.configurarTeclas()
	
	
	
	const city = new City(
		position = game.at(0,0)
	)
	
	game.addVisual(city)
	
	game.addVisual(personaje)
	
	const a0 = new Arbol(
		position = game.at(0,0)
	)
	game.addVisual(a0)
	const a1 = new Arbol(
		position = game.at(2,0)
	)
	game.addVisual(a1)
	const a2 = new Arbol(
		position = game.at(4,0)
	)
	game.addVisual(a2)
	const a3 = new Arbol(
		position = game.at(6,0)
	)
	game.addVisual(a3)
	const a4 = new Arbol(
		position = game.at(8,0)
	)
	game.addVisual(a4)
	const a5 = new Arbol(
		position = game.at(10,0)
	)
	game.addVisual(a5)
	const a6 = new Arbol(
		position = game.at(12,0)
	)
	game.addVisual(a6)
	const a7 = new Arbol(
		position = game.at(14,0)
	)
	game.addVisual(a7)
	const a8 = new Arbol(
		position = game.at(16,0)
	)
	game.addVisual(a8)
	const a9 = new Arbol(
		position = game.at(18,0)
	)
	game.addVisual(a9)
	const a10 = new Arbol(
		position = game.at(20,0)
	)
	game.addVisual(a10)
	const a11 = new Arbol(
		position = game.at(22,0)
	)
	
	game.addVisual(a11)
	const a12 = new Arbol(
		position = game.at(24,0)
	)
	game.addVisual(a12)
	const a14 = new Arbol(
		position = game.at(24,2)
	)
	game.addVisual(a14)
	const a15 = new Arbol(
		position = game.at(24,4)
	)
	game.addVisual(a15)
	const a16 = new Arbol(
		position = game.at(24,6)
	)
	game.addVisual(a16)	
	const a18 = new Arbol(
		position = game.at(24,12)
	)
	game.addVisual(a18)
	const a20 = new Arbol(
		position = game.at(24,14)
	)
	game.addVisual(a20)
	const a21 = new Arbol(
		position = game.at(24,16)
	)
	game.addVisual(a21)
	const a22 = new Arbol(
		position = game.at(22,16)
	)
	game.addVisual(a22)
	const a23 = new Arbol(
		position = game.at(20,16)
	)
	game.addVisual(a23)
	const a24 = new Arbol(
		position = game.at(18,16)
	)
	game.addVisual(a24)
	const a25 = new Arbol(
		position = game.at(16,16)
	)
	game.addVisual(a25)
	const a26 = new Arbol(
		position = game.at(14,16)
	)
	game.addVisual(a26)
	const a27 = new Arbol(
		position = game.at(12,16)
	)
	game.addVisual(a27)
	const a28 = new Arbol(
		position = game.at(10,16)
	)
	game.addVisual(a28)
	const a29 = new Arbol(
		position = game.at(8,16)
	)
	game.addVisual(a29)
	const a30 = new Arbol(
		position = game.at(6,16)
	)
	game.addVisual(a30)
	const a33 = new Arbol(
		position = game.at(0,16)
	)
	game.addVisual(a33)
	const a34 = new Arbol(
		position = game.at(0,14)
	)
	game.addVisual(a34)
	const a35 = new Arbol(
		position = game.at(0,12)
	)
	game.addVisual(a35)
	const a36 = new Arbol(
		position = game.at(0,10)
	)
	game.addVisual(a36)
	const a37 = new Arbol(
		position = game.at(0,8)
	)
	game.addVisual(a37)
	const a38 = new Arbol(
		position = game.at(0,6)
	)
	game.addVisual(a38)
	const a39 = new Arbol(
		position = game.at(2,6)
	)
	game.addVisual(a39)
	const a40 = new Arbol(
		position = game.at(4,6)
	)
	game.addVisual(a40)
	const a41 = new Arbol(
		position = game.at(6,6)
	)
	game.addVisual(a41)
	const a42 = new Arbol(
		position = game.at(8,6)
	)
	game.addVisual(a42)
	const a43 = new Arbol(
		position = game.at(10,6)
	)
	game.addVisual(a43)
	const a44 = new Arbol(
		position = game.at(12,6)
	)
	game.addVisual(a44)
	const a45 = new Arbol(
		position = game.at(14,6)
	)
	game.addVisual(a45)
	const a46 = new Arbol(
		position = game.at(16,6)
	)
	game.addVisual(a46)
	const gim = new Gimnasio(
		position = game.at(2,16)
	)
	game.addVisual(gim)
	const cen = new Centro(
		position = game.at(24,8)
	)
	game.addVisual(cen)
	
	//carteles
	const c1 = new CartelGym(
		image = "cartelM.png",
		position = game.at(4,14)
	)
	game.addVisual(c1)
		const c2 = new CartelMarket(
		image = "cartelM.png",
		position = game.at(22,10)
	)
	game.addVisual(c2)
	
	//invisible	
	const a19 = new ArbolInvisible(
		position = game.at(24,10))
		a19.image("arbolInvisible.png")
	game.addVisual(a19)
	
	const a31 = new ArbolInvisible(
		position = game.at(4,16))
		a31.image("arbolInvisible.png")
	game.addVisual(a31)
	
	const inv1 = new ArbolInvisible(
		position = game.at(0,2))
		inv1.image("arbolInvisible.png")
	game.addVisual(inv1)
	const inv2 = new ArbolInvisible(
		position = game.at(0,4))
		inv2.image("arbolInvisible.png")
	game.addVisual(inv2)
	
	// batalla piso
	
	const p1 = new IconPiso(position = game.at(6,4))
	game.addVisual(p1)
	const p2 = new IconPiso(position = game.at(12,2))
	game.addVisual(p2)
	const p3 = new IconPiso(position = game.at(18,4))
	game.addVisual(p3)
	const p4 = new IconPiso(position = game.at(20,10))
	game.addVisual(p4)
	const p5 = new IconPiso(position = game.at(22,14))
	game.addVisual(p5)
	const p6 = new IconPiso(position = game.at(12,8))
	game.addVisual(p6)
	const p7 = new IconPiso(position = game.at(8,12))
	game.addVisual(p7)
	const p8 = new IconPiso(position = game.at(2,10))
	game.addVisual(p8)
	const p9 = new IconPiso(position = game.at(4,2))
	game.addVisual(p9)
	const p10 = new IconPiso(position = game.at(14,12))
	game.addVisual(p10)
	/*
	*/
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
		
	
}





object gimnasio inherits Gimnasio{
	override method position() = game.at(0,0)
	
	method iniciar(){
	const batalla = new Batalla()
	
	game.addVisual(self)
	game.addVisual(personaje)
	game.addVisual(batalla)
	game.addVisual(rival)	
	self.pelea()
	}
	
	
}

object market{
	
	method iniciar(){
		
		const market = new Market(
		position = game.at(0,0)
	)
	
	//game.addVisual(market)
	game.addVisual(market)
	game.addVisual(enfermera)	
	}

}

object piso inherits IconPiso{
	
	method iniciar(){
		
	const piso = new PeleaPiso()
	
	//game.addVisual(self)
	game.addVisual(piso)
	self.pelea()
	}
	
}

