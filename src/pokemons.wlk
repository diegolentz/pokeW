import wollok.game.*

class Pokemon{
	var property vida = 100
	var property nivel = 4
	//const ataques = [0,1,2]
	//var ataque = self.atacar()
	
	
	
	
	method atacar(){
		var ataque = 0.randomUpTo(3).truncate(0)
		var damage = 0
		
		if (ataque == 0){
			damage = self.ataqueMin()
		}else if(ataque == 1){
			damage = self.ataqueMed()
		}else {
			damage = self.ataqueAlt()
		} 
		return damage
		}
	
	
	
	
	method ataqueMin(){
		return  nivel * 10 
	}
	method ataqueMed(){
		return nivel * 15 
	}
	method ataqueAlt(){
		return nivel * 20
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