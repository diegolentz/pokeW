import wollok.game.*
class Mapa{
	
    method position() = game.at(0,0)
}


class City inherits Mapa{
	method image() = "city.png"
	
}

class Batalla inherits Mapa{
	method image() = "peleaPiso.jpg"
	

}
class Market inherits Mapa{
	method image() = "centro_pokemon.jpg"
	
}

class PeleaPiso inherits Mapa{
	method image() = "peleaPiso.jpg"
}