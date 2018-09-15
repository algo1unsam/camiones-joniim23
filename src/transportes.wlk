/*
 Parte 2
La empresa tiene un único camión, al que por ahora queremos poder:
* cargarle una cosa,
* descargarle una cosa
* preguntarle si tiene cargado una cosa, por ejemplo si tiene cargado el paquete de ladrillos. 
 */
 
/*
 Parte 3
 * Carga máxima:
* Calcular la carga actual del camión, es decir, la suma de los pesos de las cosas cargadas en el camión.
* Calcular la carga disponible del camión, es decir, la diferencia entre la carga máxima (que es un valor configurable) y la carga actual.
* Saber si un camión puede aceptar una cosa, es decir si al cargar esa cosa no se superaría la carga máxima.
* Modificar la carga del camión para que sólo se cargue si puede hacerse.  

 * Peligrosidad:
* Saber cuál es la cosa más peligrosa que tiene un camión.
* Saber si un camión puede circular por una ruta, dado el nivel de peligrosidad máximo de la ruta. 
* Por ejemplo, queremos poder preguntar si un camión puede circular en una ruta cuyo límite de peligrosidad es 10. 
* Para eso tiene que pasar que ningún elemento del camión supera los 10 puntos de peligrosidad.

 */
 import cargas.*
 
object camion 
{
	var cargaActual = []
	const cargaMaxima = 250
	const peligrosidadRuta = 10
	
	method cargar(carga)
	{
		if (self.puedeCargar(carga))
		{
			cargaActual.add (carga)
		}
		else
		{
			error.throwWithMessage("El peso de " + carga + " es mayor al limite " + self.cargaDisponible())
		}
	}
	
	method descargar(carga)
	{
		cargaActual.remove (carga)
	}
	
	method tenesLaCarga(carga)
	{
		return cargaActual.any
		(
			cargas => cargas.contains(carga)
		)
		
	}
	
	method calcularCarga()
	{
		return cargaActual.sum
		{
			carga => cargaActual.peso()
		}
	}
	
	method cargaDisponible()
	{
		return ( cargaMaxima - self.calcularCarga() )
	}
	
	method puedeCargar(carga)
	{
		return self.cargaDisponible() - carga.peso()  >= 0
	}
	
	method cargaMasPeligrosa()
	{
		return cargaActual.max
		{
			carga => carga.peligrosidad()
		}
	}
	
	method puedeCircular()
	{
		return cargaActual.all
		{
			carga => carga.peligrosidad() < peligrosidadRuta
		}
	}
}

object motoneta
{
	var cargaActual = []
	const cargaMaxima = 100
	const peligrosidadMaxima = 5
	
	method cargar(carga)
	{
		if (self.puedeCargar(carga))
		{
			cargaActual.add(carga)
		}
		else
		{
			error.throwWithMessage("El peso de " + carga + " es mayor al limite " + self.cargaDisponible())
		}
	}
	
	method descargar(carga)
	{
		cargaActual.remove (carga)
	}
	
	method tenesLaCarga(carga)
	{
		return cargaActual.contains(carga)
	}
	
	method calcularCarga()
	{
		return cargaActual.sum
		{
			carga => cargaActual.peso()
		}
	}
	
	method cargaDisponible()
	{
		return ( cargaMaxima - self.calcularCarga() )
	}
	
	method peligrosidadActual()
	{
		return cargaActual.sum
		{
			carga => carga.peligrosidad()
		}
	}
	
	method puedeCargar(carga)
	{
		return 
		{
			self.cargaDisponible() - carga.peso() >= 0
			and
			self.peligrosidadActual() < peligrosidadMaxima
		}
	}
}

/* Parte 4: Motoneta
La empresa adquirió un segundo transporte: una motoneta. 
* La motoneta puede cargar hasta 100 kilogramos y sólo puede llevar cosas que tengan hasta 5 puntos de peligrosidad. 
* Asegurarse de que el depósito la pueda recibir igual que al camión.
 */ 
  
 