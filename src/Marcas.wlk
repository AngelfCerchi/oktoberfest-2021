class MarcasCervezas {
	var property contenidoLupulo
	var property paisFabricacion // Aleman, Checo,Belga
	//Bonus - precio de venta
	var property precioPorLitro = 100
	
	// metodo abstracto
	
	method graduacionA()
}

class Rubia inherits MarcasCervezas{
	var property graduacionA 

}

class Negra inherits MarcasCervezas{
	
	var property graduacionReglamentaria = 5
	override method graduacionA() = graduacionReglamentaria.min(contenidoLupulo*2)
	
}

class Roja inherits Negra{
	override method graduacionA() = super() * 1.25
}


class Jarra{
	var property capacidad = 1
	var property marca
	var property seSirvioEnLaCarpa 
	
	//Bonus - precio de venta
	var property precioQueSeVendio = 0
	
	method contenidoDeAlcohol() = capacidad * (marca.graduacionA()*0.01)
}