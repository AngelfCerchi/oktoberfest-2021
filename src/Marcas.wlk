object graduacionReglamentaria{
	var property graduacionA = 5 //porcentaje
}

class MarcasCervezas {
	var property contenidoLupulo
	var property paisFabricacion // Aleman, Checo,Belga
	
	// metodo abstracto
	method graduacionA()
}

class Rubia inherits MarcasCervezas{
	var property graduacionA 
}

class Negra inherits MarcasCervezas{
	override method graduacionA() = graduacionReglamentaria.graduacionA().min(contenidoLupulo*2)
}

class Roja inherits Negra{
	override method graduacionA() = super() * 1.25
}


class Jarra{
	var property capacidad = 1
	var property marca
	
	method contenidoDeAlcohol() = capacidad * (marca.graduacionA()*0.01)
}