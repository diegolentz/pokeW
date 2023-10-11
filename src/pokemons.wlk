import wollok.game.*

class Pokemon{
	var property vida = 100
	var property nivel = 4
	const ataques = [0,1,2]
	
	
	
	
	method atacar(){
		var ataque = 0.randomUpTo(3).truncate(0)
		return ataque
	}
	
	method ataqueMin(){
		
		var danio = nivel * 10 
		return danio
	}
	method ataqueMed(){
		var danio = nivel * 15 
		return danio
	}
	method ataqueAlt(){
		var danio = nivel * 20
		return danio
	}
	
	
	
}

object blastoise inherits Pokemon {
	const nombreAtaques = ["punetazo","chorro de agua","hidrobomba"]
	
	
}
object mewTwo inherits Pokemon {
	
	
}
object machamp inherits Pokemon {
	var property position = game.at(15,11)	
	var property image = "machamp.png"
	
}
object charmileon inherits Pokemon {
 	var property position = game.at(7,5)	
	var property image = "charmileon.png"
	//var position = game.at(10,10)
	
}