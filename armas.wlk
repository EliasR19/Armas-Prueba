import game.*
import personaje.*
import paleta.*

object pistola{
    var position = game.at(5,7)
    var property estaEquipada = false
    var jugador = jack


    method text() = "Pistola"
    method textColor() = paleta.gris()
    
    method position(_position){
        position = _position
    }
    method position(){
        if(self.estaEquipada())
            return (game.at(jugador.position().x() + 1, jugador.position().y()))
        else {
            return position
        }
    }
    
    // Interaccon con jugador ( agarrar/equipar )
    method agarrar(){
                jack.equiparArma(self)
                self.position(game.at(jack.position().x() + 1, jack.position().y()))

    }
    
    method estaEquipada(_estaEquipada){
        estaEquipada = _estaEquipada
    }

    //disparar

}

object balaPistola{
    var dano = 10 // para despues
    var maxDistancia = 5    //distancia en celdas
    var  distanciaRecorrida = 10
    


    //position
    var position = game.at(1,0)
    var property positionDisparo = self.position()

    method text() = "bala\n Distancia\n" + self.distanciaRecorrida() 
    method textColor() = paleta.gris()

    method position(){
        return position
    }
    method position(_position){
        position = _position
    }

    //intento de mover bala
    method distanciaRecorrida(){
        return distanciaRecorrida
    }
    method distanciaRecorrida(_distanciaRecorrida){
        distanciaRecorrida = _distanciaRecorrida
    }

    method disparo(){
        self.distanciaRecorrida(0)
        self.positionDisparo(self.position())
        self.moverBala()
    }

    method moverBala(){
        //mover bala con loop armado 001
        
        if(distanciaRecorrida < maxDistancia){
            self.distanciaRecorrida(self.distanciaRecorrida() + 1)

            self.position(game.at(self.positionDisparo().x() + 1 , self.positionDisparo().y()))
            self.positionDisparo(self.position())

            
            enemigo.morir()

        } else if(distanciaRecorrida >= maxDistancia){
            self.position(game.at(1,0))
            
        } else{
            null
        }

        /* Intento de loop 002
        5.times( { n => self.distanciaRecorrida(self.distanciaRecorrida() + 1)
            self.position(game.at(self.positionDisparo().x() + 1 , self.positionDisparo().y()))
            self.positionDisparo(self.position())

            enemigo.morir()

        } )
        self.position(game.at(1,0))
        */
    }

    //polimorfismo  pero en realidad no, porque este objeto deberia ir en otro archivo :)
    method agarrar(){
        return null
    }

}

