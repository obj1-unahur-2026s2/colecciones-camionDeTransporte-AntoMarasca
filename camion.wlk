import cosas.*

object camion {
    const contenedor = []

    method pesoTara() = 1000
    method pesoMaximoPermitido() {return 2500}
    method pesoTotal() {
        return self.pesoTara() + contenedor.sum({c => c.peso()})
    } 

    method cargarCosas(cosa) {
        contenedor.add(cosa)
    }
    method descargarCosas(cosa) {
        contenedor.remove(cosa)
    }
    //Para saber si el peso de cada cosa es par
    method todosLosPesosSonPares() {
        return contenedor.all({c => c.peso().even()})
    }
    //Para saber si hay alguna cosa que tiene un peso determinado
    method cosaPesaLoMismo(pesoAComparar) {
        return contenedor.any({c => c.peso() == pesoAComparar})
    }
    //Para saber la primer cosa cargada que tiene un nivel de peligrosidad determinado
    method primerCosaCargadaConPeligrosidad(nivelP) {
        return contenedor.find({c => c.peligrosidad() == nivelP})
    }
    //Obtiene todas las cosas que superan un determinado nivel de peligrosidad
    method cosasQueSuperanNivelDePeligrosidad(nivelP) {
        return contenedor.filter({ c => c.peligrosidad() > nivelP})
    }
    //Para poder consultar la lista de cosas que superen el nivel de peligrosidad de una cosa dada
    method cosasQueSuperanNivelDeCosa (cosa) {
        return contenedor.filter({ c => c.peligrosidad() > cosa.peligrosidad() })
    }
    
    //Para saber si el camion esta excedido del peso maximo que es 2500
    method pesoEsMayorAlPermitido() {
        return self.pesoTotal() > self.pesoMaximoPermitido()
    }
    
    /*
        Para saber si el camion puede circular en ruta, debe no exceder el peso maximo y que 
        ninguna cosa cargada supere el nivel maximo de peligrosidad que depende del viaje 
        (ese valor se pasa como argumento)
    */
    method puedeCircularEnRuta(nivelMaximoDePeligrosidad) {
        return !self.pesoEsMayorAlPermitido() && contenedor.all({ c => c.peligrosidad() < nivelMaximoDePeligrosidad })
    }
    
    method tieneAlgoQuePesaEntreUnMinimoYUnMaximo(min, max) {
        return contenedor.any({ c => c.peso().between(min, max)})
    }
    method cosaMasPesadaQueHay() {
        return contenedor.max()({ c => c.peso()})
    }
}
