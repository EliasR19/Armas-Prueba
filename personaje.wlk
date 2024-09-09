import game.*
import armas.*
import paleta.*
import randomin.*

object jack{
    var property position = game.origin()
    var arma = null
    var property tieneArmaEquipada = false



    method text() = "Jack \nArma: " + arma + "\nposition" + self.position()
    method textColor() = paleta.rojo()



/// ARMA    
    method equiparArma(_arma){
        self.arma(_arma)
        arma.estaEquipada(true)
        self.tieneArmaEquipada(true)
    }
    
    method arma(_arma){
        arma = _arma
    }


    method decir(texto){
        return texto
    }

// Disparar
    method disparar(bala){
        if(self.tieneArmaEquipada()){
            bala.position(arma.position())
            bala.disparo()
        } else {
            null
        }
    }




    //caminar

    method mover(direccion){
        position = direccion.siguiente(self.position())
    }


}

object enemigo{

    var bala = balaPistola


    method text() = "enemigo >:D \n Pos: " + self.position()
    method textColor() = paleta.rojo()

    var property position = game.at(8,1)


    method morir(){
        if(bala.position() == self.position()){
            self.position(game.at(alAzar.numero(),alAzar.numero()))
            bala.distanciaRecorrida(10)
        }
    }




    // polimorfismo mal hecho (detalles)
    method agarrar(){
        return null
    }
}