import wollok.game.*
import config.*
import personaje.*


class Edificio {
	
	var property position = 0
	var property image = "gimnasio1.png"
	
	
	
	
}





class Gimnasio inherits Edificio{
	override method image(){
		image = "gimnasio.png"
	}
	
}
class Centro inherits Edificio{
	override method image(){
		image = "mercado.png"
	}
}
