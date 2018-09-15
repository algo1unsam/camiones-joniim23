/*
 * De las cosas que puede transportar el camión nos interesa el peso y la peligrosidad:
* Knight Rider: pesa 500 kilos y su nivel de peligrosidad es 10 puntos.
* Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en auto o 30 si está en su forma de robot.
* Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. La peligrosidad es siempre de dos puntos. 
 */
object knightRider 
{
	method peso() { return 500 }
	method peligrosidad() { return 10 }
}

object bumblebee 
{
	var transformacion = 15
	
	method peso() { return 800 }
	
	method transformacion(tipo) 
	{
		transformacion = tipo
	}
	
	method peligrosidad() { return transformacion }
}

object paqueteDeLadrillos 
{
	const pesoLadrillo = 2
	var property cantidad = 1
	method peso() 
	{ 
		return (pesoLadrillo * cantidad)
	}
	method peligrosidad() { return 2 }
}

object contenedorPortuario
{
	var contenedor = []
	method agregarCosas(carga)
	{
		contenedor.add(carga)
	}
	
	method peso() 
	{ 
		return contenedor.sum{ cargas => cargas.peso() }
	}
	
	method calcularPeligrosidad()
	{
		return contenedor.max{ cargas => cargas.peligrosidad() }
	}
	
	method peligrosidad() 
	{
		if (contenedor.isEmpty())
		{
			return 0
		}
		else
		{
			return self.calcularPeligrosidad()
		}
	}
}
/*
 * Parte 5: Más cosas para transportar
Contenedor portuario: Un contenedor puede tener otras cosas adentro. 
* El peso es 100 + la suma de todas las cosas que esté adentro. 
* Es tan peligroso como el objeto más peligroso que contiene. Si está vacío es 0.
 */
