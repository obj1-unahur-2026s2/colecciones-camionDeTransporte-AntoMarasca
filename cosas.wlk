object cosas {
    
}

object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}
//Puede estar como auto y su peligrosidad es de 15 o como robot 30 y su peligrosidad va a ser de 30
object bumblebee {
    var esAuto = true

    method transformadoEnAuto() {
        esAuto = true
    }
    method tranformadoEnRobot() {
        esAuto = false
    }
    method peligrosidad() {
        if (esAuto) {
            return 15
        } else {
            return 30
        }
    } 
    method peso() = 800
}
//La cantidad de ladrillos puede variar pero el peso del ladrillo no
object paqueteDeLadrillos {
    var cantidadDeLadrillos = 1

    method cantidadDeLadrillos(nuevaCantidad) {
        cantidadDeLadrillos = nuevaCantidad
    }
    method peso() = 2 * cantidadDeLadrillos
    method peligrosidad() = 2
}
//El peso varia, la peligrosidad no
object arenaAGranel {
    var peso = 10

    method cambiarPeso(nuevoPeso) {
        peso = nuevoPeso
    }
    method peso() = peso
    method peligrosidad() = 1
}
//Si tiene los misiles pesa 300 y la peligrosidad es 100, si no los tiene pesa 200 y la peligrosidad es 0
object bateriaAntiaerea {
    var misiles = true

    method cargarMisiles() {
        misiles = true
    }
    method descargarMisiles() {
        misiles = false
    }

    method peso() {
        if (misiles) {
            return 300
        } else {
            return 200
        }
    }

    method peligrosidad() {
        if (misiles) {
            return 100
        } else {
            return 0
        }
    }
}
/*
    Puede tener otras cosas adentro y su peso va a ser 100 + la suma de lo que tenga adentro, 
    si no tiene nada la peligrosidad es 0, sino el nivel es de la cosa mas peligrosa que este dentro
*/
object contenedorPortuario {
    const contenido = []

    method cargarCosas(cosa) {
        contenido.add(cosa)
    }
    method descargarCosas(cosa) {
        contenido.remove(cosa)
    }

    method peso() {
        return 100 + contenido.sum({c => c.peso()})
    }
    method peligrosidad() {
        if (contenido.isEmpty()) {
            return 0
        } else {
            return contenido.max({ c => c.peligrosidad() }).peligrosidad()
        }
    }
}

object residuosRadioactivos {
    var peso = 10

    method cambiarPeso(nuevoPeso) {
        peso = nuevoPeso
    }
    method peso() = peso
    method peligrosidad() = 200
}
/*
    Como es una envoltura, el peso es el peso de lo que envuelve y la peligrosidad es la mitad de 
    lo que envuelve
*/
object embalajeDeSeguridad {
    var cosaEmbalada = residuosRadioactivos

    method cambiarObjetoEmbalado(nuevoObjeto) {
        cosaEmbalada = nuevoObjeto
    }
    method objetoEmbalado() = cosaEmbalada
    
    method peso() {
        return self.objetoEmbalado().peso()
    }
    method peligrosidad() {
        return self.objetoEmbalado().peligrosidad() / 2
    }
}