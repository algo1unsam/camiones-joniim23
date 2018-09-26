/*
 Parte 2
 * La empresa también tiene un depósito, que guarda las cosas hasta que son agregadas a un camión. El depósito debe poder:
* recibir cosas. Por ejemplo podrían llegar al mismo tiempo Bumblebee y un paquete de ladrillos, y queremos guardarlos en el depósito.
* llenar un camión. Cuando le pedimos a un depósito que llene un camión se toman una por una las cosas que están en el depósito y se las carga en el camión.
 */
import transportes.*
import cargas.*

object deposito 
{
	var almacen = []
	
	method almacenar(carga)
	{
		almacen.add(carga)
	}
	
	method llenarTransporte(transporte)
	{
		almacen.forEach 
		{
			cargaAlmacen => transporte.cargar(cargaAlmacen)
			// TODO acá faltaría sacar la carga del almacen
		}
	}
	//!Atención: asegurarse de que la carga máxima también se verifica cuando el depósito recibe un camión
}
