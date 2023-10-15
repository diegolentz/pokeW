import wollok.game.*
class Mapa{
	
    var property position = game.at(0,0)
}


class City inherits Mapa{
	var property image = "city.png"
	
}

class Batalla inherits Mapa{
	var property image = "pelea.png"
	
	method batalla(){
		
	}
	
}
class Market inherits Mapa{
	var property image = "centro_pokemon.jpg"
	
}