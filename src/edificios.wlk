import wollok.game.*
import config.*








object gimnasio1 {
	var property position = game.at(51,25)
	var property image = "gimnasio1.png"
	method hablar() {
		game.say(self,"aaaaa")
	}
	
}
object gimnasio2{
	var property position = game.at(5,50)
	var property image = "gimnasio2.png"
	method hablar() {
		game.say(self,"aaaaa")
	}
}

object casa{
	var property position = game.at(15,20)
	var property image = "casa1.png"
	//var property puerta = game.at(3,21)
	method hablar() {
		game.say(self,"aaaaa")
	}
		
}
object mercado{
	var property position = game.at(7,20)
	var property image = "mercado.png"
	method hablar() {
		game.say(self,"aaaaa")
	}
}
object no{
	var property position = game.at(5,17)
	var property image = "mercadosa.png"
}
object noo{
	var property position = game.at(5,18)
	var property image = "mercadosa.png"
}
object arboles {
	const property arboles = [mercado,casa]
}

