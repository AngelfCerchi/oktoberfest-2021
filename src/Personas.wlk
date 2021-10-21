import Marcas.*

class Persona {
	const cervezasCompradas = [] //jarras
	var property peso = 80
	var property musicaTradicional = false
	var property nivelDeAguante = 50
	
	method comprarJarra(jarra) = cervezasCompradas.add(jarra)
	method alcoholEnSangre() = cervezasCompradas.sum({ j => j.contenidoDeAlcohol() })
	method cantidadCompradas() = cervezasCompradas.size()
	method estaEbria() = self.alcoholEnSangre() * peso > nivelDeAguante
	
	//metodo abstracto
	method leGusta(marcaCerveza)

}
class Belga inherits Persona{
	override method leGusta(marcaCerveza) = marcaCerveza.contenidoLupulo() > 4 
}
class Checo inherits Persona{
	override method leGusta(marcaCerveza) = marcaCerveza.graduacionA() > 8
}

class Aleman inherits Persona{
	override method leGusta(marcaCerveza) = true
}


